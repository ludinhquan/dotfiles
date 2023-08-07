local options = {
    request = {
        timeout = 30, 
        autosave = true  
    },
    response = {
        show_headers = 'all',
        window_type = 'v',
        size = 50,
        redraw = true
    },
    output = {
        save = false,
        override = true,
        folder = "output",
    },
    internal = {
        log_debug = false,
    }
}

return options
