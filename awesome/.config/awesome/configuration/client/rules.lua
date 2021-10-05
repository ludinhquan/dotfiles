local awful = require('awful')
local gears = require('gears')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

-- Rules
awful.rules.rules = {
  {
    rule_any = {class = {"Microsoft Teams - Preview", "TelegramDesktop", "Slack", "Skype"}},
    properties = {tag = '2', switch_to_tag=true},
  },
  {
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      keys = client_keys,
      buttons = client_buttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_offscreen,
      floating = false,
      maximized = false,
      above = false,
      below = false,
      ontop = false,
      sticky = false,
      maximized_horizontal = false,
      maximized_vertical = false
    }
  },
  -- Floating clients.
  {
    rule_any = {type = {'dialog'}, class = {}, name = {"Picture in picture"}},
    properties = {
      placement = awful.placement.centered,
      ontop = true,
      floating = true,
      drawBackdrop = true,
      shape = function()
        return function(cr, w, h)
          gears.shape.rectangle(cr, w, h)
        end
      end,
      skip_decoration = true
    }
  }
}
