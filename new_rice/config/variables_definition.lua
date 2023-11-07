-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
web_browser = "firefox"

editor_cmd = terminal .. " -e " .. editor
web_browser_cmd = terminal .. " -e " .. web_browser

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
-- }}}
