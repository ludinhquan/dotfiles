local awful = require('awful')
require('awful.autofocus')
local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')

local clientKeys =
  awful.util.table.join(
  awful.key(
    {modkey},
    'f',
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = 'toggle fullscreen', group = 'client'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'q',
    function(c)
      c:kill()
    end,
    {description = 'close', group = 'client'}
  ),
  -- awful.key(
  --   {modkey}, 'v',
  --   function() awful.util.spawn_with_shell(apps.default.change_input_method) end,
  --   {description = 'change input method', group = 'client'}
  -- ),
  awful.key(
    {'Control', 'Shift'}, 'o',
    function() awful.util.spawn_with_shell("rofi -show window") end,
    {description = 'change input method', group = 'client'}
  ),
  awful.key(
    {altkey}, 'c',
    function() awful.util.spawn_with_shell(apps.default.change_output_device) end,
    {description = 'change output device', group = 'client'}
  )
)

return clientKeys
