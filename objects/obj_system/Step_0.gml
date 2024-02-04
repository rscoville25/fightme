if window_get_fullscreen() {
	onoff[0] = "On"
} else {
	onoff[0] = "Off"
}

if time_limit {
	onoff[1] = "On"
} else {
	onoff[1] = "Off"
}

if boxes_vis {
	onoff[2] = "On"
} else {
	onoff[2] = "Off"
}

if turbo {
	onoff[3] = "On"
} else {
	onoff[3] = "Off"
}

if room == room_main_menu {
	if !options_screen {
		if keyboard_check_pressed(vk_up) {
			audio_play_sound(snd_select, 10, false)
			if main_menu_select > 0 {
				main_menu_select -= 1
			} else {
				main_menu_select = 2
			}
		}
		if keyboard_check_pressed(vk_down) {
			audio_play_sound(snd_select, 10, false)
			if main_menu_select < 2 {
				main_menu_select += 1
			} else {
				main_menu_select = 0
			}
		}
		if keyboard_check_pressed(vk_enter) {
			if main_menu_select == 0 {
				audio_play_sound(snd_select, 10, false, 1, 0, 1.1)
				room_goto(room_select)
			} else if main_menu_select == 2 {
				audio_play_sound(snd_select, 10, false, 1, 0, 1.1)
				options_screen = true
			}
		}
	} else {
		if keyboard_check_pressed(vk_up) {
			audio_play_sound(snd_select, 10, false)
			if option_selected > 0 {
				option_selected -= 1
			} else {
				option_selected = array_length(options)	
			}
		}		
		if keyboard_check_pressed(vk_down) {
			audio_play_sound(snd_select, 10, false)
				option_selected += 1
		}
		if keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) {
			audio_play_sound(snd_select, 10, false, 1, 0, 1.1)
			if option_selected % array_length(options) == 0 {
				if window_get_fullscreen() {
					window_set_fullscreen(false)
				} else {
					window_set_fullscreen(true)
				}
			}
			if option_selected % array_length(options) == 1 {
				if time_limit {
					time_limit = false
				} else {
					time_limit = true
				}
			}
			if option_selected % array_length(options) == 2 {
				if boxes_vis {
					boxes_vis = false
				} else {
					boxes_vis = true
				}
			}
			if option_selected % array_length(options) == 3 {
				if turbo {
					turbo = false
				} else {
					turbo = true
				}
			}
		}

		if keyboard_check_pressed(vk_enter) {
			options_screen = false
			ini_open("options.ini")
			ini_write_real("options", "fullscreen", window_get_fullscreen())
			ini_write_real("options", "time_limit", time_limit)
			ini_write_real("options", "boxes_vis", boxes_vis)
			ini_write_real("options", "turbo", turbo)
			ini_close()
		}
	}
}




framecount += 1

if room == Room1 {
	if framecount % 60 == 0 {
		timer -= 1
	}
	if timer < 0 {
		if time_limit {
			room_restart()
		}
	}

}
