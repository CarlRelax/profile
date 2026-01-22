local wezterm = require("wezterm")
-- local mux = wezterm.mux

-- 保留config_builder()对象，改用增量配置（关键修复）
local config = wezterm.config_builder()

-- 增量设置配置项，不再用config = {}覆盖
config.native_macos_fullscreen_mode = true
config.automatically_reload_config = true
config.enable_tab_bar = true
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"
config.color_scheme = "Nord (Gogh)"
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 15 -- 若仍有空白，可改为12或13（整数）

-- bar
-- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
-- tabline.setup()
-- tabline.apply_to_config(config)
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
	position = "top",
	max_width = 32,
	padding = {
		left = 1,
		right = 1,
		tabs = {
			left = 0,
			right = 1,
		},
	},
	separator = {
		space = 1,
		left_icon = wezterm.nerdfonts.fa_long_arrow_right,
		right_icon = wezterm.nerdfonts.fa_long_arrow_left,
		field_icon = wezterm.nerdfonts.indent_line,
	},
	modules = {
		tabs = {
			active_tab_fg = 4,
			inactive_tab_fg = 6,
			new_tab_fg = 2,
		},
		workspace = {
			enabled = true,
			icon = wezterm.nerdfonts.cod_window,
			color = 8,
		},
		leader = {
			enabled = true,
			icon = wezterm.nerdfonts.oct_rocket,
			color = 2,
		},
		zoom = {
			enabled = true,
			icon = wezterm.nerdfonts.md_fullscreen,
			color = 4,
		},
		pane = {
			enabled = true,
			icon = wezterm.nerdfonts.cod_multiple_windows,
			color = 7,
		},
		username = {
			enabled = true,
			icon = wezterm.nerdfonts.fa_user,
			color = 6,
		},
		hostname = {
			enabled = true,
			icon = wezterm.nerdfonts.cod_server,
			color = 8,
		},
		clock = {
			enabled = true,
			icon = wezterm.nerdfonts.md_calendar_clock,
			format = "%H:%M",
			color = 5,
		},
		cwd = {
			enabled = true,
			icon = wezterm.nerdfonts.oct_file_directory,
			color = 7,
		},
		spotify = {
			enabled = true,
			icon = wezterm.nerdfonts.fa_spotify,
			color = 3,
			max_width = 64,
			throttle = 15,
		},
	},
})

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
			File = "C:\\Users\\Carl\\little-king.png",
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
		-- width = 100,
		-- height = 100,
		width = "100%",
		height = "100%",
		opacity = 0.75,
	},
}

-- 快捷键配置（保留）
config.keys = config.keys or {}
table.insert(config.keys, {
	key = "F11",
	mods = "",
	action = wezterm.action.ToggleFullScreen,
})
table.insert(config.keys, {
	key = "x",
	mods = "CTRL",
	action = wezterm.action.CloseCurrentPane({ confirm = false }),
})
table.insert(config.keys, {
	key = "-",
	mods = "CTRL|ALT",
	action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
})
table.insert(config.keys, {
	key = "\\",
	mods = "CTRL|ALT",
	action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
})
table.insert(config.keys, {
	key = "h",
	mods = "CTRL",
	action = wezterm.action.ActivatePaneDirection("Left"),
})

return config
