#!/bin/bash
PR="$1"

read -r BASE HEAD < <(gh pr view "$PR" --json baseRefName,headRefName \
  --jq '[.baseRefName, .headRefName] | @tsv')

tmux_window="PR-$PR"
tmux list-windows -F '#{window_name}' 2>/dev/null | grep -qx "$tmux_window" \
  && tmux select-window -t "$tmux_window" && exit 0

DIRECTIVE=$(mktemp)
WORKTRUNK_DIRECTIVE_FILE="$DIRECTIVE" command wt switch pr:"$PR" 2>&1 || true
rm -f "$DIRECTIVE"

worktree=$(git worktree list 2>/dev/null | awk -v branch="[$HEAD]" '$3==branch{print $1}')
worktree="${worktree/#\~/$HOME}"
[[ -z "$worktree" ]] && { echo "worktree not found for $HEAD"; exit 1; }

main_worktree=$(git worktree list 2>/dev/null | awk 'NR==1{print $1}')
cp "$main_worktree/packages/backend/.env" "$worktree/packages/backend/.env"
cp "$main_worktree/packages/frontend/.env" "$worktree/packages/frontend/.env"

review_prompt="Review PR #$PR against $BASE following the project code review rules. Do NOT post any comments to GitHub — just provide the summary here."
tmux new-window -n "$tmux_window" -c "$worktree" \
  "pnpm install && claude '$review_prompt'; exec zsh"
