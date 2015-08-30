theme                               = {}

themes_dir                          = os.getenv("HOME") .. "/.config/awesome/themes/steamburn"
theme.wallpaper                     = themes_dir .. "/wall.png"

theme.useless_gap_width             = 6

theme.font                          = "Source Code Pro 10.5"
theme.fg_normal                     = "#00bfff"
theme.fg_focus                      = "#da70d6"
theme.fg_urgent                     = "#CC9393"
theme.bg_normal                     = "#000000"
theme.bg_focus                      = "#550022"
theme.bg_urgent                     = "#2a1f1e"
theme.taglist_bg_focus              = "#000000"
theme.tasklist_bg_focus             = "#000000"
theme.border_width                  = 2
theme.border_normal                 = "#302627"
theme.border_focus                  = "#550022"
theme.border_marked                 = "#CC9393"
theme.menu_height                   = 16
theme.menu_width                    = 140

theme.submenu_icon                  = themes_dir .. "/icons/submenu.png"
theme.taglist_squares_sel           = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel         = themes_dir .. "/icons/square_unsel.png"

theme.tasklist_disable_icon         = false
theme.tasklist_floating             = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""

theme.submenu_icon                  = themes_dir .. "/icons/submenu.png"
theme.widget_temp                   = themes_dir .. "/icons/temp.png"
theme.widget_uptime                 = themes_dir .. "/icons/ac.png"
theme.widget_cpu                    = themes_dir .. "/icons/cpu.png"
theme.widget_weather                = themes_dir .. "/icons/dish.png"
theme.widget_fs                     = themes_dir .. "/icons/fs.png"
theme.widget_mem                    = themes_dir .. "/icons/mem.png"
theme.widget_fs                     = themes_dir .. "/icons/fs.png"
theme.widget_note                   = themes_dir .. "/icons/note.png"
theme.widget_note_on                = themes_dir .. "/icons/note_on.png"
theme.widget_netdown                = themes_dir .. "/icons/net_down.png"
theme.widget_netup                  = themes_dir .. "/icons/net_up.png"
theme.widget_mail                   = themes_dir .. "/icons/mail.png"
theme.widget_batt                   = themes_dir .. "/icons/bat.png"
theme.widget_clock                  = themes_dir .. "/icons/clock.png"
theme.widget_vol                    = themes_dir .. "/icons/spkr.png"

theme.layout_txt_tile               = "[t]"
theme.layout_txt_tileleft           = "[l]"
theme.layout_txt_tilebottom         = "[b]"
theme.layout_txt_tiletop            = "[tt]"
theme.layout_txt_fairv              = "[fv]"
theme.layout_txt_fairh              = "[fh]"
theme.layout_txt_spiral             = "[s]"
theme.layout_txt_dwindle            = "[d]"
theme.layout_txt_max                = "[m]"
theme.layout_txt_fullscreen         = "[F]"
theme.layout_txt_magnifier          = "[M]"
theme.layout_txt_floating           = "[|]"
theme.layout_txt_termfair           = "[termfair]"
theme.layout_txt_uselessfair        = "[fair]"
theme.layout_txt_uselessfairh       = "[fairh]"
theme.layout_txt_uselessdwindle     = "[dwindle]"
theme.layout_txt_uselesstile        = "[tile]"

theme.vol                           = themes_dir .. "/icons/vol.png"
theme.vol_low                       = themes_dir .. "/icons/vol_low.png"
theme.vol_no                        = themes_dir .. "/icons/vol_no.png"
theme.vol_mute                      = themes_dir .. "/icons/vol_mute.png"
theme.widget_bg                     = themes_dir .. "/icons/widget_bg.png"
theme.ac                            = themes_dir .. "/icons/ac.png"
theme.bat                           = themes_dir .. "/icons/bat.png"
theme.bat_low                       = themes_dir .. "/icons/bat_low.png"
theme.bat_no                        = themes_dir .. "/icons/bat_no.png"

return theme
