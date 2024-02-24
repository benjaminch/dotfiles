local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Peppermint'

config.font = wezterm.font 'Fira Code'
config.font =
  wezterm.font('JetBrains Mono', { weight = 'Bold', italic = false })


return config
