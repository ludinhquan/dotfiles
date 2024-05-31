local awful = require("awful")
local naughty = require("naughty")
local xrandr = require("module.xrandr")
require("awful.autofocus")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local modkey = require("configuration.keys.mod").modKey
local altkey = require("configuration.keys.mod").altKey
local apps = require("configuration.apps")

function poweroff_command()
	awful.spawn.with_shell("poweroff")
	awful.keygrabber.stop(_G.exit_screen_grabber)
end

-- Key bindings
local globalKeys = awful.util.table.join(
	-- Hotkeys
	awful.key({ modkey, "Control" }, "b", function()
		awful.util.spawn_with_shell(apps.default.change_background)
	end, { description = "change background", group = "quan" }),
	awful.key({ modkey }, "p", function()
		xrandr.xrandr()
	end, { description = "switch screen", group = "quan" }),
	awful.key({ altkey }, "space", function()
		_G.screen.primary.left_panel:toggle(true)
	end, { description = "show main menu", group = "awesome" }),
	awful.key({ modkey }, "F1", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey }, "d", function()
		local flag = false
		for _, c in ipairs(mouse.screen.selected_tag:clients()) do
			if c.minimized == true then
				flag = true
			end
			c.minimized = true
		end
		for _, c in ipairs(mouse.screen.selected_tag:clients()) do
			if flag == true then
				c.minimized = false
			end
		end
	end, { description = "minimize all clients", group = "awesome" }),
	awful.key({ modkey }, "s", function()
		_G.awesome.spawn(apps.default.rofi)
	end, { description = "show main menu", group = "awesome" }),
	-- Tag browsing
	awful.key({ modkey }, "Tab", awful.tag.viewnext, { description = "view previous", group = "tag" }),
	awful.key({ modkey, "Shift" }, "Tab", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "q", function()
		client.focus:kill()
	end, { description = "close", group = "client" }),
	awful.key({ modkey }, "w", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "h", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "l", awful.tag.viewnext, { description = "view next", group = "tag" }),

	-- Default client focus
	awful.key({ modkey }, "e", function()
		awful.util.spawn_with_shell(apps.default.files)
	end, { description = "Open files system", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ altkey }, "Tab", function()
		awful.client.focus.byidx(1)
		if _G.client.focus then
			_G.client.focus:raise()
		end
	end, { description = "Switch to next window", group = "client" }),
	--Programms
	awful.key({ modkey }, "\\", function()
		awful.util.spawn_with_shell(apps.default.lock)
	end, { description = "Lock the screen", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "s", function()
		awful.util.spawn_with_shell(apps.default.flameshot_area)
	end, { description = "Mark an area and screenshot", group = "screenshots (clipboard)" }),
	awful.key({ modkey, "Shift" }, "a", function()
		awful.util.spawn_with_shell(apps.default.flameshot_full)
	end, { description = "Take a screenshot of your active monitor", group = "screenshots (clipboard)" }),
	awful.key({ modkey }, "b", function()
		awful.util.spawn(apps.default.browser)
	end, { description = "open a browser", group = "launcher" }),

	-- Standard program
	-- awful.key({modkey}, 't',
	--   function() awful.util.spawn_with_shell(apps.default.terminal) end,
	--   {description = 'open a terminal', group = 'launcher'}
	-- ),
	awful.key({ altkey, "Control" }, "r", _G.awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Control" }, "q", _G.awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "Return", function()
		awful.spawn(apps.default.terminal)
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "p", function()
		_G.exit_screen_show()
	end, { description = "end session menu", group = "awesome" }),
	awful.key({ altkey, "Shift" }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ altkey, "Shift" }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ altkey, "Shift" }, "j", function()
		awful.client.incwfact(0.05)
	end, { description = "decrease master height factor", group = "layout" }),
	awful.key({ altkey, "Shift" }, "k", function()
		awful.client.incwfact(-0.05)
	end, { description = "increase master height factor", group = "layout" }),
	awful.key({ modkey, "Control" }, "Left", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "Right", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn("xbacklight -inc 10")
	end, { description = "+10%", group = "hotkeys" }),
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn("xbacklight -dec 10")
	end, { description = "-10%", group = "hotkeys" }),
	awful.key({}, "F6", function()
		awful.spawn("amixer -D pulse sset Master 5%+")
	end, { description = "volume up", group = "hotkeys" }),
	awful.key({}, "F5", function()
		awful.spawn("amixer -D pulse sset Master 5%-")
	end, { description = "volume down", group = "hotkeys" }),
	awful.key({}, "F7", function()
		awful.spawn("amixer -D pulse set Master 1+ toggle")
	end, { description = "toggle mute", group = "hotkeys" }),
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn("amixer -D pulse sset Master 5%+")
	end, { description = "volume up", group = "hotkeys" }),
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn("amixer -D pulse sset Master 5%-")
	end, { description = "volume down", group = "hotkeys" }),
	awful.key({}, "XF86AudioMute", function()
		awful.spawn("amixer -D pulse set Master 1+ toggle")
	end, { description = "toggle mute", group = "hotkeys" }),
	awful.key({ altkey }, "i", function()
		awful.spawn("amixer -D pulse sset Master 5%+")
	end, { description = "volume up", group = "hotkeys" }),
	awful.key({ altkey }, "d", function()
		awful.spawn("amixer -D pulse sset Master 5%-")
	end, { description = "volume down", group = "hotkeys" }),
	awful.key({ altkey }, "m", function()
		awful.spawn("amixer -D pulse set Master 1+ toggle")
	end, { description = "toggle mute", group = "hotkeys" }),
	awful.key({}, "XF86PowerOff", function()
		_G.exit_screen_show()
	end, { description = "toggle mute", group = "hotkeys" }),

	-- Screen management
	awful.key(
		{ modkey },
		"o",
		awful.client.movetoscreen,
		{ description = "move window to next screen", group = "client" }
	),
	-- Open default program for tag
	awful.key({ modkey }, "n", function()
		awful.spawn(awful.screen.focused().selected_tag.defaultApp, {
			tag = _G.mouse.screen.selected_tag,
			placement = awful.placement.bottom_right,
		})
	end, { description = "open default program for tag/workspace", group = "tag" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	-- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
	local descr_view, descr_toggle, descr_move, descr_toggle_focus
	if i == 1 or i == 9 then
		descr_view = { description = "view tag #", group = "tag" }
		descr_toggle = { description = "toggle tag #", group = "tag" }
		descr_move = { description = "move focused client to tag #", group = "tag" }
		descr_toggle_focus = { description = "toggle focused client on tag #", group = "tag" }
	end
	globalKeys = awful.util.table.join(
		globalKeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, descr_view),
		-- Win+Alt+Left/Right: move client to prev/next tag and switch to it
		awful.key({ altkey, "Control" }, "h", function()
			local t = client.focus and client.focus.first_tag or nil
			if t == nil then
				return
			end
			local tag = client.focus.screen.tags[(t.name - 2) % 9 + 1]
			if tag == nil then
				return
			end
			awful.client.movetotag(tag)
			awful.tag.viewprev()
		end, { description = "move client to previous tag and switch to it", group = "layout" }),
		awful.key({ altkey, "Control" }, "l", function()
			local t = client.focus and client.focus.first_tag or nil
			if t == nil then
				return
			end
			local tag = client.focus.screen.tags[(t.name % 9) + 1]
			if tag == nil then
				return
			end
			awful.client.movetotag(tag)
			awful.tag.viewnext()
		end, { description = "move client to next tag and switch to it", group = "layout" }),

		awful.key(
			{ modkey },
			"c",
			naughty.destroy_all_notifications,
			{ description = "clear notifications", group = "awesome" }
		),

		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if _G.client.focus then
				local tag = _G.client.focus.screen.tags[i]
				if tag then
					_G.client.focus:move_to_tag(tag)
				end
			end
		end, descr_move),
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if _G.client.focus then
				local tag = _G.client.focus.screen.tags[i]
				if tag then
					_G.client.focus:toggle_tag(tag)
				end
			end
		end, descr_toggle_focus)
	)
end

return globalKeys
