local wibox = require('wibox')
local beautiful = require('beautiful')

local clock = wibox.widget.textclock('<span font="' .. beautiful.font .. '">%a, %b %d %H:%M</span>')
return clock
