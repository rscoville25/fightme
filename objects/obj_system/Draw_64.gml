if room == room_main_menu {
	if !options_screen {
		if main_menu_select != 0 {
			draw_sprite(spr_local, 0, 640, 100)
		} else {
			draw_sprite(spr_local, 1, 640, 100)
		}
		
		if main_menu_select != 1 {
			draw_sprite(spr_online, 0, 640, 164)
		} else {
			draw_sprite(spr_online, 1, 640, 164)
		}
	
		if main_menu_select != 2 {
			draw_sprite(spr_options, 0, 640, 228)
		} else {
			draw_sprite(spr_options, 1, 640, 228)
		}
		
		if main_menu_select != 3 {
			draw_sprite(spr_exit, 0, 640, 292)
		} else {
			draw_sprite(spr_exit, 1, 640, 292)
		}
	}
	
	if options_screen {
		draw_sprite(spr_options_menu, 0, room_width / 2, room_height / 2)
		draw_sprite(spr_option_selected, 0, room_width / 2, (36 * (1 + option_selected % array_length(options)) + 70))
		draw_set_color(c_black)
		draw_set_font(fnt_options)
		for(var i = 0; i < array_length(options); i += 1) {
			draw_text((room_width / 4) + 16, (36 * (1 + i)) + 70, options[i])
		}
		
		for(var j = 0; j < array_length(onoff); j += 1) {
			draw_text((room_width * 0.75) - 88, (36 * (1 + j)) + 70, onoff[j])
		}
	}
}



if room == room_select {
	draw_sprite(spr_shoto_idle, 0 , 640, 300)
}

if room == Room1 {
	draw_set_color(c_white)
	draw_set_font(fnt_timer)
	if time_limit {
		draw_text((room_width / 2) - 52, 0, string(timer))
	}
	draw_set_font(fnt_score)
}

