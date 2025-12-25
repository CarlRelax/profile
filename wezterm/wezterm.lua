local wezterm = require("wezterm")
local mux = wezterm.mux

-- 保留config_builder()对象，改用增量配置（关键修复）
local config = wezterm.config_builder()

-- 增量设置配置项，不再用config = {}覆盖
config.native_macos_fullscreen_mode = true
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"
config.color_scheme = "Nord (Gogh)"
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 15 -- 若仍有空白，可改为12或13（整数）

-- 核心：设置零内边距，消除WezTerm默认空白
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- 背景配置（可保留，也可简化）
config.background = {
	{
		source = {
			File = "/Users/carl/Downloads/【哲风壁纸】卡通-小王子-星星.png",
		},
		hsb = {
			hue = 1.0,
			saturation = 1.02,
			brightness = 0.25,
		},
		width = "100%",
		height = "100%",
	},
	{
		source = {
			Color = "#000000",
		},
		width = "100%",
		height = "100%",
		opacity = 0.55,
	},
}

-- 快捷键配置（保留）
config.keys = config.keys or {}
table.insert(config.keys, {
	key = "F11",
	mods = "",
	action = wezterm.action.ToggleFullScreen,
})

return config
