config.load_autoconfig()

# ui colors
COLOR_MAIN              = "#191c25"
COLOR_MAIN_DARKER       = "#161921"
COLOR_BLACK             = "#32353e"
COLOR_BLACK_BRIGHTER    = "#4b4e57"
COLOR_RED               = "#fc2f52"
COLOR_RED_BRIGHTER      = "#ff6480"
COLOR_GREEN             = "#659ea2"
COLOR_GREEN_BRIGHTER    = "#47d4b9"
COLOR_WHITE             = "#cdd4e0"
COLOR_WHITE_BRIGHTER    = "#ffffff"

c.colors.statusbar.normal.bg = COLOR_MAIN
c.colors.statusbar.insert.bg = COLOR_MAIN
c.colors.statusbar.command.bg = COLOR_MAIN
c.colors.statusbar.progress.bg = COLOR_BLACK

c.colors.statusbar.url.fg = COLOR_WHITE
c.colors.statusbar.url.success.https.fg = COLOR_WHITE
c.colors.statusbar.url.success.http.fg = COLOR_WHITE
c.colors.statusbar.url.error.fg = COLOR_WHITE
c.colors.statusbar.url.warn.fg = COLOR_WHITE
c.colors.statusbar.url.hover.fg = COLOR_WHITE

c.colors.tabs.bar.bg = COLOR_MAIN_DARKER
c.colors.tabs.odd.bg = COLOR_MAIN_DARKER
c.colors.tabs.even.bg = COLOR_MAIN_DARKER
c.colors.tabs.odd.fg = COLOR_BLACK_BRIGHTER
c.colors.tabs.even.fg = COLOR_BLACK_BRIGHTER
c.colors.tabs.selected.odd.bg = COLOR_MAIN
c.colors.tabs.selected.even.bg = COLOR_MAIN
c.colors.tabs.selected.odd.fg = COLOR_WHITE
c.colors.tabs.selected.even.fg = COLOR_WHITE

c.colors.completion.category.bg = COLOR_MAIN
c.colors.completion.category.fg = '#eceff4'
c.colors.completion.item.selected.bg = '#ffffff'
c.colors.completion.item.selected.fg = '#000000'
# c.colors.completion.bg = '#2e3440'
# c.colors.completion.fg = '#000000'

# c.colors.messages.error.bg = '#bf616a'
# c.colors.messages.warning.bg = '#ebcb8b'
# c.colors.messages.info.bg = '#a3be8c'

# c.colors.downloads.bar.bg = '#2e3440'
# c.colors.downloads.start.bg = '#5e81ac'
# c.colors.downloads.stop.bg = '#a3be8c'

c.colors.webpage.preferred_color_scheme = "light"

# fonts
c.fonts.default_size = "11pt"

# tabs and status bar
c.statusbar.show = "always"
c.tabs.show = "multiple"
c.tabs.padding = {"top": 1, "bottom": 1, "left": 5, "right": 5}
c.tabs.indicator.width = 0
c.tabs.title.format = "{audio} {current_title}"

# general behavior
c.auto_save.session = False
c.content.autoplay = False
c.editor.command = ["nvim", "{}"]
c.scrolling.smooth = True

# bindings
config.bind('<Ctrl-s>', 'config-cycle tabs.show always never')

# search engines
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'g': 'https://www.google.com/search?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'gh': 'https://github.com/search?q={}',
    'r': 'https://www.reddit.com/search/?q={}'
}

# startup page
c.url.start_pages = ["https://start.duckduckgo.com"]
c.url.default_page = "https://start.duckduckgo.com"
