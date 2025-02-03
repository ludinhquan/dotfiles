local awful = require("awful")
local naughty = require("naughty")

local modkey = require("configuration.keys.mod").modKey
local altkey = require("configuration.keys.mod").altKey
local apps = require("configuration.apps")

require("awful.autofocus")

local clientKeys = awful.util.table.join(
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey, "Shift" }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	-- awful.key(
	--   {modkey}, 'v',
	--   function() awful.util.spawn_with_shell(apps.default.change_input_method) end,
	--   {description = 'change input method', group = 'client'}
	-- ),
	awful.key({ "Control", "Shift" }, "o", function()
		awful.util.spawn_with_shell("rofi -show window")
	end, { description = "change input method", group = "client" }),
	awful.key({ altkey }, "c", function()
		awful.util.spawn_with_shell(apps.default.change_output_device)
	end, { description = "change output device", group = "client" }),
	awful.key({ modkey }, "m", function()
		local c = client.focus
		if c then
			c.minimized = true -- Minimize the currently focused window
		end
	end, { description = "minimize window", group = "client" }),
	awful.key({ modkey }, "i", function(c)
		c.sticky = not c.sticky -- Toggle the "sticky" property
		if c.sticky then
			naughty.notify({ title = "Window Sticky", text = "This window is now sticky (visible on all tags)." })
		else
			naughty.notify({ title = "Window Unsticky", text = "This window is no longer sticky." })
		end
	end, { description = "toggle sticky", group = "client" })
)

return clientKeys
