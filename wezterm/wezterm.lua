local wezterm = require 'wezterm'
local os = require 'os'

local wsl_domains = wezterm.default_wsl_domains()

-- Always use zsh in my WSL.  but really: I recommend running `chsh` inside WSL to make it the default!
for idx, dom in ipairs(wsl_domains) do
	if dom.name == "WSL:Ubuntu" then
		dom.default_prog = {"zsh"}
		dom.default_cwd = "~"
    else
        dom.default_prog = {"bash"}
        dom.default_cwd = "~"
    end
end

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

function get_hostname(cwd_uri)
    wezterm.log_info("CWD " .. cwd_uri)
    local cwd = ""
    local hostname = ""
    if cwd_uri then
        cwd_uri = cwd_uri:sub(8);
        local slash = cwd_uri:find("/")
        if slash then
            hostname = cwd_uri:sub(1, slash-1)
            -- Remove the domain name portion of the hostname
            local dot = hostname:find("[.]")
            if dot then
                hostname = hostname:sub(1, dot-1)
            end
            -- and extract the cwd from the uri
            cwd = cwd_uri:sub(slash)
        end
    end
	return hostname
end

function get_working_dir(cwd_uri)
    wezterm.log_info("CWD " .. cwd_uri)
    local cwd = ""
    local hostname = ""
    if cwd_uri then
        cwd_uri = cwd_uri:sub(8);
        local slash = cwd_uri:find("/")
        if slash then
            hostname = cwd_uri:sub(1, slash-1)
            -- Remove the domain name portion of the hostname
            local dot = hostname:find("[.]")
            if dot then
                hostname = hostname:sub(1, dot-1)
            end
            -- and extract the cwd from the uri
            cwd = cwd_uri:sub(slash)
        end
    end
	return cwd
end

wezterm.on("toggle-ligature", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.harfbuzz_features then
        -- If we haven't overridden it yet, then override with ligatures disabled
        overrides.harfbuzz_features =  {"calt=0", "clig=0", "liga=0"}
    else
        -- else we did already, and we should disable out override now
        overrides.harfbuzz_features = nil
    end
    window:set_config_overrides(overrides)
end)

-- The powerline < symbol
local LEFT_ARROW = utf8.char(0xe0b3);
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

wezterm.on("update-right-status", function(window, pane)
    -- Each element holds the text for a cell in a "powerline" style << fade
    local cells = {};

    -- -- Figure out the cwd and host of the current pane.
    -- -- This will pick up the hostname for the remote host if your
    -- -- shell is using OSC 7 on the remote host.
    -- local cwd_uri = pane:get_current_working_dir()
    -- if cwd_uri then
    --     cwd_uri = cwd_uri:sub(8);
    --     local slash = cwd_uri:find("/")
    --     local cwd = ""
    --     local hostname = ""
    --     if slash then
    --         hostname = cwd_uri:sub(1, slash-1)
    --         -- Remove the domain name portion of the hostname
    --         local dot = hostname:find("[.]")
    --         if dot then
    --             hostname = hostname:sub(1, dot-1)
    --         end
    --         -- and extract the cwd from the uri
    --         cwd = cwd_uri:sub(slash)

    --         table.insert(cells, cwd);
    --         -- table.insert(cells, hostname);
    --     end
    -- end

    -- UserVars
    local os_type = pane:get_user_vars().os
    if os_type ~= nil then
        wezterm.log_info("os_type: " .. os_type)
        if os_type == "Ubuntu" then
            table.insert(cells, wezterm.nerdfonts.dev_ubuntu)
        end
    end

    -- 找出在 wezterm 下執行的程式
    local process_name = pane:get_foreground_process_name()
    if process_name ~= nil then
        wezterm.log_info("process_name = " .. process_name)
        local exec_name = basename(process_name):gsub("%.exe$", "")
        wezterm.log_info("exec_name = " .. exec_name)
        if exec_name == "wslhost" then
            exec_name = wezterm.nerdfonts.mdi_microsoft .. wezterm.nerdfonts.fa_linux
        end
        table.insert(cells, exec_name);
    end

    -- I like my date/time in this style: "Wed Mar 3 08:14"
    local date = wezterm.strftime("%a %b %-d %H:%M");
    table.insert(cells, date);

    -- An entry for each battery (typically 0 or 1 battery)
    for _, b in ipairs(wezterm.battery_info()) do
        local battery_icon = wezterm.nerdfonts.mdi_battery_plus
        percent = math.floor(b.state_of_charge * 10)
        wezterm.log_info("battery state: " .. b.state .. " SOC: " .. b.state_of_charge .. " percent: " .. tostring(percent))
        if b.state == "Full" then
            battery_icon = wezterm.nerdfonts.mdi_battery
        elseif b.state == "Charging" then
            if percent == 10 then
                battery_icon = wezterm.nerdfonts.mdi_battery
            elseif percent == 9 then
                battery_icon = wezterm.nerdfonts.mdi_battery_charging_90
            elseif percent == 8 then
                battery_icon = wezterm.nerdfonts.mdi_battery_charging_80
            elseif percent == 7 then
                battery_icon = wezterm.nerdfonts.mdi_battery_charging_60 -- no mdi_battery_charging_70 glyph
            elseif percent == 6 then
                battery_icon = wezterm.nerdfonts.mdi_battery_charging_60
            elseif percent == 5 then
                battery_icon = wezterm.nerdfonts.mdi_battery_charging_40 -- no mdi_battery_charging_50 glyph
            elseif percent == 4 then
                battery_icon = wezterm.nerdfonts.mdi_battery_charging_40
            elseif percent == 3 then
                battery_icon = wezterm.nerdfonts.mdi_battery_charging_30
            elseif percent <= 2 then
                battery_icon = wezterm.nerdfonts.mdi_battery_charging_20
            end
        elseif b.state == "Discharging" then
            if percent == 10 then
                battery_icon = wezterm.nerdfonts.mdi_battery
            elseif percent == 9 then
                battery_icon = wezterm.nerdfonts.mdi_battery_90
            elseif percent == 8 then
                battery_icon = wezterm.nerdfonts.mdi_battery_80
            elseif percent == 7 then
                battery_icon = wezterm.nerdfonts.mdi_battery_70
            elseif percent == 6 then
                battery_icon = wezterm.nerdfonts.mdi_battery_60
            elseif percent == 5 then
                battery_icon = wezterm.nerdfonts.mdi_battery_50
            elseif percent == 4 then
                battery_icon = wezterm.nerdfonts.mdi_battery_40
            elseif percent == 3 then
                battery_icon = wezterm.nerdfonts.mdi_battery_30
            elseif percent == 2 then
                battery_icon = wezterm.nerdfonts.mdi_battery_20
            elseif percent == 1 then
                battery_icon = wezterm.nerdfonts.mdi_battery_10
            elseif percent < 1 then
                battery_icon = wezterm.nerdfonts.mdi_battery_alert .. wezterm.nerdfonts.mdi_battery_outline
            end
        elseif b.state == "Empty" then
            battery_icon = wezterm.nerdfonts.mdi_battery_alert .. wezterm.nerdfonts.mdi_battery_outline
        else
            battery_icon = wezterm.nerdfonts.mdi_battery_unknown
        end
        table.insert(cells, string.format("%s %.0f%%", battery_icon, b.state_of_charge * 100))
    end

    -- Color palette for the backgrounds of each cell
    -- -- right status theme Dracula
    -- local colors = {
    --     "#3c1361",
    --     "#52307c",
    --     "#663a82",
    --     "#7c5295",
    --     "#b491c8",
    -- };
    -- -- Foreground color for the text across the fade
    -- local text_fg = "#c0c0c0";

    -- right status theme Dracula
    local colors = {
        "#618d3f",
        "#79b04f",
        "#8ebd6b",
        "#a1c884",
        "#bcd7a7",
    };
    -- Foreground color for the text across the fade
    local text_fg = "#0e1013";

    -- The elements to be formatted
    local elements = {};
    -- How many cells have been formatted
    local num_cells = 0;

    -- Translate a cell into elements
    function push(text, is_first, is_last)
        local cell_no = num_cells + 1
        if is_first then
            table.insert(elements, {Foreground={Color=colors[cell_no]}})
            table.insert(elements, {Text=SOLID_LEFT_ARROW})
        end
        table.insert(elements, {Foreground={Color=text_fg}})
        table.insert(elements, {Background={Color=colors[cell_no]}})
        table.insert(elements, {Text=" "..text.." "})
        if not is_last then
            table.insert(elements, {Foreground={Color=colors[cell_no+1]}})
            table.insert(elements, {Text=SOLID_LEFT_ARROW})
        end
        num_cells = num_cells + 1
    end

    while #cells > 0 do
        local cell = table.remove(cells, 1)
        push(cell, num_cells == 0, #cells == 0)
    end

    window:set_right_status(wezterm.format(elements));
end)

-- local Grey = "#0f1419"
-- local LightGrey = "#2c2e34"
-- tab bar theme Dracula
-- local TAB_BAR_BG = "#282c34"
-- local ACTIVE_TAB_BG = "#8310A8"
-- local ACTIVE_TAB_FG = "#c0c0c0"
-- local HOVER_TAB_BG = "#2c2e34"
-- local HOVER_TAB_FG = "#c0c0c0"
-- local NORMAL_TAB_BG = { "#2c2e34", "#3b3e48" }
-- local NORMAL_TAB_FG = "#c0c0c0"

-- tab bar theme one darker
local TAB_BAR_BG = "#1f2329"
local ACTIVE_TAB_BG = "#8ebd6b"
local ACTIVE_TAB_FG = "#0e1013"
local HOVER_TAB_BG = "#2c2e34"
local HOVER_TAB_FG = "#c0c0c0"
local NORMAL_TAB_BG = { "#2c2e34", "#3b3e48" }
-- local NORMAL_TAB_BG = { "#282c34", "#323641" }
local NORMAL_TAB_FG = "#c0c0c0"

local active_tab_index = 1

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
	panes = panes
	config = config
	max_width = max_width

	local background = NORMAL_TAB_BG[(tab.tab_index) % 2 + 1]
	local foreground = NORMAL_TAB_FG

	local is_first = tab.tab_id == tabs[1].tab_id
	local is_last = tab.tab_id == tabs[#tabs].tab_id

	if tab.is_active then
	    active_tab_index = tab.tab_index
    end

	if tab.is_active then
		background = ACTIVE_TAB_BG
		foreground = ACTIVE_TAB_FG
	elseif hover then
		background = HOVER_TAB_BG
		foreground = HOVER_TAB_FG
	end

    local leading_fg = NORMAL_TAB_FG
    local leading_bg = background

	local trailing_fg = background
	local trailing_bg = NORMAL_TAB_BG[1]

	if is_first then
		-- leading_fg = TAB_BAR_BG
		leading_fg = background -- 第一個不要箭頭
	else
        leading_fg = NORMAL_TAB_BG[(tab.tab_index) % 2 + 1]
	end

    if tab.tab_index ==  active_tab_index - 1 then
        trailing_bg = ACTIVE_TAB_BG
    else
        if is_last then
		    trailing_bg = HOVER_TAB_BG
        else
            trailing_bg = NORMAL_TAB_BG[(tab.tab_index + 1) % 2 + 1]
        end
    end

	-- local title = tab.active_pane.title
    -- local process_name = tab.active_pane.foreground_process_name
    -- local exec_name = basename(process_name):gsub("%.exe$", "")
	local hostname = get_hostname(tab.active_pane.current_working_dir)
	--local title = get_working_dir(tab.active_pane.current_working_dir)
	local title = ""..tab.tab_index .." ".. hostname
	-- local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width-3) .. " "
	local clean_title = "" .. wezterm.truncate_right(title, max_width-3) .. ""

	return {
		{Attribute={Italic=false}},
		{Attribute={Intensity=hover and "Bold" or "Normal"}},
		-- {Background={Color=leading_bg}},  {Foreground={Color=leading_fg}},
		-- 	{Text=SOLID_RIGHT_ARROW},
		{Background={Color=background}},  {Foreground={Color=foreground}},
			{Text=" "..clean_title.." "},
		{Background={Color=trailing_bg}}, {Foreground={Color=trailing_fg}},
			{Text=SOLID_RIGHT_ARROW},
	}
end)

-- function log_proc(proc, indent)
--   indent = indent or ""
--   wezterm.log_info(indent .. "pid=" .. proc.pid .. ", name=" .. proc.name .. ", status=" .. proc.status)
--   wezterm.log_info(indent .. "argv=" .. table.concat(proc.argv, " "))
--   wezterm.log_info(indent .. "executable=" .. proc.executable .. ", cwd=" .. proc.cwd)
--   for pid, child in pairs(proc.children) do
--     log_proc(child, indent .. "  ")
--   end
-- end

-- wezterm.on("mux-is-process-stateful", function(proc)
--   log_proc(proc)

--   -- Just use the default behavior
--   return nil
-- end)

return {
	-- font
    font = wezterm.font_with_fallback({
        {
            family = "FiraCode NF",
            -- Some fonts make available extended options via stylistic sets.
            -- If you use the Fira Code font, it lists available stylistic sets
            -- here: https://github.com/tonsky/FiraCode/wiki/How-to-enable-stylistic-sets
            harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0', "ss05", "ss03"}, -- ss05 @, ss03 &
        },
        "Noto Sans TC",
        "Noto Sans SC",
    }),
    -- font_rules = {
    --     -- Define a rule that matches when italic text is shown
    --     {
    --         -- If specified, this rule matches when a cell's italic value exactly
    --         -- matches this.  If unspecified, the attribute value is irrelevant
    --         -- with respect to matching.
    --         italic = true,

    --         -- Match based on intensity: "Bold", "Normal" and "Half" are supported
    --         -- intensity = "Normal",

    --         -- Match based on underline: "None", "Single", and "Double" are supported
    --         -- underline = "None",

    --         -- Match based on the blink attribute: "None", "Slow", "Rapid"
    --         -- blink = "None",

    --         -- Match based on reverse video
    --         -- reverse = false,

    --         -- Match based on strikethrough
    --         -- strikethrough = false,

    --         -- Match based on the invisible attribute
    --         -- invisible = false,

    --         -- When the above attributes match, apply this font styling
    --         font = wezterm.font_with_fallback({ family = "MesloLGS NF", italic = true, weight = "Bold"}),
    --     },
        -- {
        --     -- Match based on underline: "None", "Single", and "Double" are supported
        --     underline = "None",
        --     -- When the above attributes match, apply this font styling
        --     font = wezterm.font_with_fallback({ family = "MesloLGS NF", italic = false, weight = "Bold"}),
        -- -- },
    -- },
	font_size = 16,
	font_shaper = "Harfbuzz",
    freetype_load_target = "Light",
    freetype_render_target = "HorizontalLcd",

    -- FIXME (<- this is an example of bolded text)
    -- 0 1 2 3 4 5 6 7 8 9
    -- Some ligatures: != <-> <-  -> ----> => ==> ===> -- --- /../;;/ #{}
    --  <> <!-- --> ->> --> <= >= ++ == === := a::b::c a&&b a||b
	-- -- Disable ligatures
	-- -- https://wezfurlong.org/wezterm/config/font-shaping.html
	-- harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

	tab_bar_style = {
		new_tab = wezterm.format{
			-- {Background={Color=HOVER_TAB_BG}}, {Foreground={Color=TAB_BAR_BG}}, {Text=SOLID_RIGHT_ARROW},
			{Background={Color=HOVER_TAB_BG}}, {Foreground={Color=HOVER_TAB_FG}}, {Text=" + "},
			{Background={Color=TAB_BAR_BG}}, {Foreground={Color=HOVER_TAB_BG}},	{Text=SOLID_RIGHT_ARROW},
		},
		new_tab_hover = wezterm.format{
			{Attribute={Italic=false}},
			{Attribute={Intensity="Bold"}},
			{Attribute={Intensity="Normal"}},
			-- {Background={Color=NORMAL_TAB_BG[1]}}, {Foreground={Color=TAB_BAR_BG}}, {Text=SOLID_RIGHT_ARROW},
			{Background={Color=NORMAL_TAB_BG[1]}}, {Foreground={Color=NORMAL_TAB_FG}}, {Text=" + "},
			{Background={Color=TAB_BAR_BG}}, {Foreground={Color=NORMAL_TAB_BG[1]}}, {Text=SOLID_RIGHT_ARROW},
		},
	},

	-- UI
	-- window_decorations = "RESIZE",
	-- initial_cols = 100,
	-- inttial_rows = 100,
	-- hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	enable_tab_bar = true,
	tab_max_width = 32,
	inactive_pane_hsb = {
		-- saturation = 0.6,
		brightness = 0.3,
	},
   	enable_scroll_bar = true,
   	scrollback_lines = 3500,
   	window_close_confirmation = "NeverPrompt",
	skip_close_confirmation_for_processes_named = {
		"bash",
		"sh",
		"zsh",
		"fish",
		"tmux",
		"nu",
		"cmd.exe",
		"pwsh.exe",
		"powershell.exe"
	},
	selection_word_boundary = " \t\n{}[]()\"'`,;:@│*",
	-- Do not hold on exit by default.
	-- Because the default 'CloseOnCleanExit' can be annoying when exiting with
	-- Ctrl-D and the last command exited with non-zero: the shell will exit
	-- with non-zero and the terminal would hang until the window is closed manually.
	exit_behavior = "Close",

	-- color
	-- color_scheme = "MaterialDark",
	-- color_scheme = "Elementary",
	-- color_scheme = "Dracula",
	-- color_scheme = "nord",
	color_scheme = "OneDarker",
	color_schemes = {
	    ["OneDark"]={
            -- The default text color
            foreground = "#abb2bf",
            -- The default background color
            background = "#282c34",
            -- Overrides the text color when the current cell is occupied by the cursor
            cursor_fg = "#282c34", -- "#dcdfe4"
            -- Overrides the cell background color when the current cell is occupied by the
            -- cursor and the cursor style is set to Block
            cursor_bg = "#98c379", -- "#a3b3cc"
            -- Specifies the border color of the cursor when the cursor style is set to Block,
            -- or the color of the vertical or horizontal bar when the cursor style is set to
            -- Bar or Underline.
            cursor_border = "#98c379", -- "#a3b3cc"
            -- the foreground color of selected text
            selection_bg = "#3e4452",
            -- the background color of selected text
            selection_fg = "#abb2bf",
            -- The color of the scrollbar "thumb"; the portion that represents the current viewport
            scrollbar_thumb = "#3b3e48",
            -- The color of the split lines between panes
            split = "#444444",
            ansi = { "#2C323C","#E06C75","#98C379","#E5C07B","#61AFEF","#C678DD","#56B6C2","#5C6370" },
            brights = { "#3E4452","#E06C75","#98C379","#E5C07B","#61AFEF","#C678DD","#56B6C2","#ABB2BF" },
            -- -- Arbitrary colors of the palette in the range from 16 to 255
            -- indexed = {[136] = "#af8700"},
        },

	    ["OneDarker"]={
            -- The default text color
            foreground = "#a0a8b7",
            -- The default background color
            background = "#1f2329",
            -- Overrides the text color when the current cell is occupied by the cursor
            cursor_fg = "#0e1013", -- "#dcdfe4"
            -- Overrides the cell background color when the current cell is occupied by the
            -- cursor and the cursor style is set to Block
            cursor_bg = "#76cce0", -- "#a3b3cc"
            -- Specifies the border color of the cursor when the cursor style is set to Block,
            -- or the color of the vertical or horizontal bar when the cursor style is set to
            -- Bar or Underline.
            cursor_border = "#76cce0", -- "#a3b3cc"
            -- the foreground color of selected text
            selection_bg = "#474e5d",
            -- the background color of selected text
            selection_fg = "#dcdfe4",
            -- The color of the scrollbar "thumb"; the portion that represents the current viewport
            scrollbar_thumb = "#3b3e48",
            -- The color of the split lines between panes
            split = "#444444",
            -- normal (palette 0-7)
            --         grey,     red,       green,    yellow,   blue,     magenta,  cyan,    white
            ansi = { "#535965","#e55561","#8ebd6b","#e2b86b","#4fa6ed","#bf68d9","#48b0bd","#a0a8b7" },
            -- light (palette 8-15)
            --            grey,  ht red,      green,   yellow,    blue,     magenta,  cyan,     white
            brights = { "#535965","#e55561","#8ebd6b","#e2b86b","#4fa6ed","#bf68d9","#48b0bd","#a0a8b7" },
            -- -- Arbitrary colors of the palette in the range from 16 to 255
            -- indexed = {[136] = "#af8700"},
            -- Since: nightly builds only
            -- When the IME, a dead key or a leader key are being processed and are effectively
            -- holding input pending the result of input composition, change the cursor
            -- to this color to give a visual cue about the compose state.
            -- compose_cursor = "orange",
        },
	},
	colors = {
        tab_bar = {
            background = TAB_BAR_BG,
        },
	},
	-- key bindings
    keys = {
        -- enable / disable ligatures
        {key="E", mods="CTRL|SHIFT", action=wezterm.action{EmitEvent="toggle-ligature"}},
    },

	-- mouse_bindings = {
	--   -- and make CTRL-Click open hyperlinks
	--   {
	--     event={Up={streak=1, button="Left"}},
	--     mods="CTRL",
	--     action="OpenLinkAtMouseCursor",
	--   },
	-- },

	-- domains
	wsl_domains = wsl_domains,
    ssh_domains = {
        {
            name = "itri-headned",
            remote_address = "52.185.150.179",
            username = "itri",
            multiplexing = "None",
        },
        {
            name = "devcsms",
            remote_address = "devcsms.evcharging.tw",
            username = "allspark",
            multiplexing = "None",
        },
        {
            name = "TPC-EV",
            remote_address = "52.175.20.122",
            username = "itri",
            multiplexing = "None",
        },
    },
	default_domain = "WSL:Ubuntu",
	-- default_domain = "itri-headend",
    -- launch_menu = {
    --     {
    --         label = "ssh itri-headend",
    --         -- The argument array to spawn.  If omitted the default program
    --         -- will be used as described in the documentation above
    --         args = {"ssh", "itri@52.185.150.179"},
    --     },
    -- }
    -- default_prog = {'wsl.exe', '~', '-d', 'Ubuntu'} -- use new feature wsl_domains
}
