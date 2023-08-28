local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  print "Failed to load colorizer"
  return
end

print("colorizer")
colorizer.setup(
  { "*" },
  {
    RGB      = true,         -- #RGB hex codes
    RRGGBB   = true,         -- #RRGGBB hex codes
    names    = true,         -- "Name" codes like Blue
    RRGGBBAA = true,         -- #RRGGBBAA hex codes
    rgb_fn   = true,         -- CSS rgb() and rgba() functions
    hsl_fn   = true,         -- CSS hsl() and hsla() functions
    css      = true,         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn   = true,         -- Enable all CSS *functions*: rgb_fn, hsl_fn
    mode     = 'background', -- Set the display mode.
  }
)
