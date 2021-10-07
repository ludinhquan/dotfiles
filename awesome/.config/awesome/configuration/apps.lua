local rofi_command = 'env /usr/bin/rofi -show drun -display-drun -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  default = {
    rofi = rofi_command,

    flameshot_area = 'flameshot gui -p ~/Pictures/screenshots',
    flameshot_full= 'flameshot full -p ~/Pictures/screenshots',

    lock = '. ~/.local/bin/lock-screen',
    change_background = '. ~/.local/bin/change-background',
    change_input_method = '. ~/.local/bin/input-source',
    change_output_device = '. ~/.local/bin/change-output-device',

    browser = 'brave',
    terminal = 'alacritty -e tmux',
    editor = 'nvim',
    files = 'nautilus',
  },
  run_on_start_up = {
    -- "teams",
    -- "slack",
    "picom -b",
    -- Network Manager Applet
    "nm-applet --indicator",
    -- Bluetooth
    "blueman-applet",
    -- Audio
    "pasystray",
    "ibus-daemon -drxR",
    'xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1'
  }
}
