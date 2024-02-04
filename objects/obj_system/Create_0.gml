framecount = 0
timer = 99
main_menu_select = 0

options_screen = false
option_selected = 0
options = ["Fullscreen", "Time Limit", "Visible Hitboxes", "Turbo"]
onoff = ["Off", "On", "Off", "Off"]
ini_open("options.ini")
window_set_fullscreen(ini_read_real("options", "fullscreen", false))
time_limit = ini_read_real("options", "time_limit", true)
boxes_vis = ini_read_real("options", "boxes_vis", false)
turbo = ini_read_real("options", "turbo", false)
ini_close()