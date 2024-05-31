local awful = require("awful")
local beautiful = require("beautiful")
local TaskList = require("widget.task-list")
local TagList = require("widget.tag-list")
local Battery = require("widget.battery")
local wibox = require("wibox")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi

local TopBar = function(s, offset)
	local systray = wibox.widget.systray()
	systray:set_horizontal(true)
	systray:set_base_size(dpi(18))

	local clock_widget = require("widget.clock")
	local system_details = wibox.widget({
		Battery,
		wibox.container.margin(systray, dpi(0), dpi(0), dpi(2), dpi(0)),
		wibox.container.margin(systray, dpi(0), dpi(0), dpi(2), dpi(0)),
		wibox.container.margin(clock_widget, dpi(15), dpi(15), dpi(0), dpi(0)),
		layout = wibox.layout.fixed.horizontal,
	})

	local panel = wibox({
		ontop = false,
		screen = s,
		height = dpi(30),
		width = s.geometry.width,
		x = s.geometry.x,
		y = s.geometry.y,
		stretch = false,
		bg = beautiful.primary.hue_900,
		fg = beautiful.fg_normal,
		opacity = 0.85,
	})

	panel:struts({
		top = panel.height - panel.y,
	})

	panel:setup({
		wibox.container.place(TaskList(s), "left"),
		wibox.container.place(TagList(s), "center"),
		wibox.container.place(system_details, "right"),
		layout = wibox.layout.ratio.horizontal,
	})

	return panel
end

return TopBar
