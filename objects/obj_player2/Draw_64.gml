if room == room_select {
	if !ready {
		draw_sprite(spr_player1, 0, 742, 300)
	} else {
		draw_sprite(spr_player1, 1, 732, 300)
	}
}

if room == Room1 {
	draw_healthbar(room_width / 2 + 64, 0, room_width, 64, (chara.hp/1000)*100, c_yellow, c_red, c_red, 0, true, false)
	draw_text(room_width - 24, 64 + 12, string(p2_score))
}