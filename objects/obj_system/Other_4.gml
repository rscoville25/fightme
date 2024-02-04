framecount = 0
timer = 99

ini_open("options.ini")
window_set_fullscreen(ini_read_real("options", "fullscreen", false))
time_limit = ini_read_real("options", "time_limit", true)
boxes_vis = ini_read_real("options", "boxes_vis", false)
turbo = ini_read_real("options", "turbo", false)
ini_close()




