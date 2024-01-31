if room == room_select {
	if !ready {
		draw_sprite(spr_player1, 0, 614, 300)
	} else {
		draw_sprite(spr_player1, 1, 614, 300)
	}

}

if room == Room1 {
	draw_healthbar(0, 0, (room_width / 2 - 64), 64, (chara.hp/1000)*100, c_yellow, c_red, c_red, 0, true, false)
	draw_text(24, 64 + 12, string(p1_score))
}
