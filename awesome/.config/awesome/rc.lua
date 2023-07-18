local gears = require('gears')
local awful = require('awful')
local naughty = require('naughty')
local dpi = require('beautiful').xresources.apply_dpi
require('awful.autofocus')
local beautiful = require('beautiful')

-- Theme
beautiful.init(require('theme'))

-- Layout
require('layout')

-- Init all modules
require('module.notifications')
require('module.auto-start')
require('module.decorate-client')
require('module.quake-terminal')
-- Backdrop causes bugs on some gtk3 applications
--require('module.backdrop')
require('module.exit-screen')

-- Setup all configurations
require('configuration.client')
require('configuration.tags')
_G.root.keys(require('configuration.keys.global'))

-- Signal function to execute when a new client appears.
_G.client.connect_signal(
  'manage',
  function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not _G.awesome.startup then
      awful.client.setslave(c)
    end

    if _G.awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
    end
  end
)

-- Enable sloppy focus, so that focus follows mouse.
_G.client.connect_signal(
  'mouse::enter',
  function(c)
    --c:emit_signal('request::activate', 'mouse_enter', {raise = true})
  end
)


-- Make the focused window have a glowing border
_G.client.connect_signal(
  'focus',
  function(c)
    c.border_color = beautiful.border_focus
  end
)

local state = {}
_G.client.connect_signal(
  'unfocus',
  function(c)
    c.border_color = beautiful.border_normal
  end
)

_G.client.connect_signal(
  'request::activate',
  function(c)
    if _G.awesome.startup then
      return
    end
    local class = {
      ["Microsoft Teams - Preview"]= true,
      ["TelegramDesktop"]= true,
      ["Slack"]= true,
      ["Skype"]= true,
      ["Firefox"] = true,
      ["Google-chrome"] = true,
      ["Brave-browser"] = true
    }

    if class[c.class] then
        local currentTag = awful.tag.selected(1).name
        local targetTag = c.first_tag.name

      if  currentTag ~= targetTag then
        awful.tag.viewidx(targetTag - currentTag)
      end
    end
  end
)

