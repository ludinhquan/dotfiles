local awful = require('awful')
local top_bar = require('layout.top-bar')
local beautiful = require('beautiful')

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
   s.top_bar = top_bar(s, true)
end)

-- Hide bars when app go fullscreen
function updateBarsVisibility()
    for s in screen do
        if s.selected_tag then
            local fullscreen = s.selected_tag.fullscreenMode
            s.top_bar.visible = not fullscreen
        end
    end
end

_G.tag.connect_signal('property::selected', function(t)
    updateBarsVisibility()
end)

_G.client.connect_signal('property::fullscreen', function(c)
    c.screen.selected_tag.fullscreenMode = c.fullscreen
    updateBarsVisibility()
end)

_G.client.connect_signal('unmanage', function(c)
    if c.fullscreen then
        c.screen.selected_tag.fullscreenMode = false
        updateBarsVisibility()
    end
end)
