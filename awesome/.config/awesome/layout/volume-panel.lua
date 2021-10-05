local beautiful = require('beautiful')
local wibox = require('wibox')
local todo_widget = require("widget.todo-widget.todo")
local dpi = require('beautiful').xresources.apply_dpi

local VolumePanel = function(s, offset)
  if offset == true then
    offsety = dpi(4)
  end
  local panel =
    wibox(
    {
      ontop = false,
      screen = s,
      height = dpi(32),
      width = dpi(46),
      x = s.geometry.width - dpi(420),
      y = s.geometry.y  + offsety,
      stretch = false,
      bg = beautiful.primary.hue_900,
      fg = beautiful.fg_normal,
      struts = {
        top = dpi(32)
      }
    }
  )

  panel:struts(
    {
      top = dpi(0)
    }
  )

  panel:setup {
      layout = wibox.layout.fixed.horizontal,
      wibox.container.margin(todo_widget(), dpi(4), dpi(4), dpi(4), dpi(4))
    }

  return panel
end

return VolumePanel
