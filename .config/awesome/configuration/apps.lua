local rofi_command =
	"env /usr/bin/rofi -show drun -display-drun -run-command \"/bin/bash -c -i 'shopt -s expand_aliases; {cmd}'\""
local open_window_command = 'env /usr/bin/rofi -show window -display-window "Open Applications"'

return {
	default = {
		rofi = rofi_command,
		open_window_command = open_window_command,

		flameshot_area = "flameshot gui",
		flameshot_full = "flameshot full -p ~/Pictures/screenshots",

		lock = ". ~/.scripts/lock-screen",
		change_background = ". ~/.scripts/change-background",
		change_input_method = ". ~/.scripts/input-source",
		change_output_device = ". ~/.scripts/change-output-device",

		browser = "brave",
		torbrowser = "tor-browser",
		terminal = "alacritty -e tmux",
		editor = "nvim",
		files = "nautilus",
	},
	run_on_start_up = {
		-- "teams",
		-- "slack",
		"picom",
		-- Network Manager Applet
		"nm-applet --indicator",
		-- Bluetooth
		"blueman-applet",

		"xfce4-power-manager",
		-- Audio
		"pasystray",
		"ibus-daemon -drxR",
		'xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1',
		'xinput set-prop "SYNA8004:00 06CB:CD8B Touchpad" "libinput Tapping Enabled" 1',
	},
}
