local wezterm = require("wezterm")

-- 保留config_builder()对象，改用增量配置（关键修复）
local config = wezterm.config_builder()

-- 窗口设置
-- config.initial_cols = 150
-- config.initial_rows = 42

-- 全屏
wezterm.on("gui-startup", function()
	local tab, pane, window = wezterm.mux.spawn_window({})
	window:gui_window():toggle_fullscreen()
end)

local border_color = "#f4dbd6"

config.colors = {
	split = border_color,
}

config.window_frame = {
	border_left_width = "0.25cell",
	border_right_width = "0.25cell",
	border_bottom_height = "0.125cell",
	border_top_height = "0.125cell",
	border_left_color = border_color,
	border_right_color = border_color,
	border_bottom_color = border_color,
	border_top_color = border_color,
}
config.adjust_window_size_when_changing_font_size = false

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
config.underline_thickness = "3px"
config.underline_position = "-6px"

-- 不活动的分屏置灰色
config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 0.3,
}

-- StatusBar
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
	position = "top",
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
			File = "/Users/carl/Downloads/【哲风壁纸】卡通-小王子-星星.png", -- MacOS
			-- File = "C:\\Users\\Carl\\little-king.png", -- Windows
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
		opacity = 0.65,
	},
}
-- 快捷键配置（保留）
config.leader = { key = "Space", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
	-- HACK 自定义Wrokspace和Pane模式(按键复杂)
	-- {
	-- 	key = "p",
	-- 	mods = "LEADER",
	-- 	action = wezterm.action.ActivateKeyTable({
	-- 		name = "pane_mode",
	-- 		one_shot = false,
	-- 		timeout_milliseconds = 1500,
	-- 	}),
	-- },
	-- {
	-- 	key = "w",
	-- 	mods = "LEADER",
	-- 	action = wezterm.action.ActivateKeyTable({
	-- 		name = "workspace_mode",
	-- 		one_shot = false,
	-- 		timeout_milliseconds = 1500,
	-- 	}),
	-- },
	{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "a", mods = "LEADER", action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }) },
	{ key = "Tab", mods = "LEADER", action = wezterm.action.SwitchWorkspaceRelative(1) },
	{ key = "Tab", mods = "LEADER|SHIFT", action = wezterm.action.SwitchWorkspaceRelative(-1) },
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "New Workspace Name",
			action = wezterm.action_callback(function(window, pane, line)
				if not line or line == "" then
					-- return NOTE It'll abort
					return ""
				end
				window:perform_action(wezterm.action.SwitchToWorkspace({ name = line }), pane)
			end),
		}),
	},
}

-- HACK 自定义Wrokspace和Pane模式(按键复杂)
-- config.key_tables = {
-- 	pane_mode = {
-- 		{ key = "-", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
-- 		{ key = "\\", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
-- 		{ key = "j", action = wezterm.action.ActivatePaneDirection("Down") },
-- 		{ key = "k", action = wezterm.action.ActivatePaneDirection("Up") },
-- 		{ key = "h", action = wezterm.action.ActivatePaneDirection("Left") },
-- 		{ key = "l", action = wezterm.action.ActivatePaneDirection("Right") },
-- 	},
-- 	workspace_mode = {
-- 		{ key = "l", action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }) },
-- 		{ key = "]", action = wezterm.action.SwitchWorkspaceRelative(1) },
-- 		{ key = "[", action = wezterm.action.SwitchWorkspaceRelative(-1) },
-- 		{
-- 			key = "n",
-- 			action = wezterm.action.PromptInputLine({
-- 				description = "New Workspace Name",
-- 				action = wezterm.action_callback(function(window, pane, line)
-- 					if not line or line == "" then
-- 						-- return NOTE It'll abort
-- 						return ""
-- 					end
-- 					window:perform_action(wezterm.action.SwitchToWorkspace({ name = line }), pane)
-- 				end),
-- 			}),
-- 		},
-- 	},
-- }
config.keys = config.keys or {}
table.insert(config.keys, {
	key = "F11",
	mods = "",
	action = wezterm.action.ToggleFullScreen,
})

return config
