-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font_size = 16
config.window_background_opacity = 0.95
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.tab_max_width = 50

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night"

-- and finally, return the configuration to wezterm
return config
