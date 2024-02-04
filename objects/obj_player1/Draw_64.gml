if room == room_select {
	if !ready {
		draw_sprite(spr_player1, 0, 576, 300)
	} else {
		draw_sprite(spr_player1, 1, 576, 300)
	}

}

if room == Room1 {
	draw_healthbar(0, 0, (room_width / 2 - 64), 64, (chara.hp/1000)*100, c_yellow, c_red, c_red, 1, true, false)
	draw_healthbar(0, 64 + 2, ((room_width / 2 - 64) / 3) - 6, 64 + 14, chara.super - 200, c_white, c_blue, c_blue, 1, true, false)
	draw_healthbar((room_width / 2 - 64) / 3, 64 + 2, (2 * (room_width / 2 - 64) / 3) - 6, 64 + 14, chara.super - 100, c_white, c_blue, c_blue, 1, true, false)
	draw_healthbar(2 * (room_width / 2 - 64) / 3, 64 + 2, (3 * (room_width / 2 - 64) / 3), 64 + 14, chara.super, c_white, c_blue, c_blue, 1, true, false)
	draw_text(24, 64 + 24, string(p1_score))
	
	if chara.combo > 1 {
		draw_text(24, 128 + 26, string(chara.combo))
		draw_text(24, 128 + 38, "combo")
		combo_disp_start = obj_system.framecount
	}
	
	if chara.combo <= 0 {
		if obj_system.framecount < combo_disp_start + 60 && obj_system.framecount > 60 {
			draw_text(24, 128 + 26, string(chara.last_combo))
			draw_text(24, 128 + 38, "combo")
		}
	}
}
