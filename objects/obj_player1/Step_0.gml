if room == room_select {
	if select_chara == 0 && obj_player2.chara != obj_shoto {
		chara = obj_shoto
	} else if select_chara == 0 {
		chara = obj_shoto2
	}
	if keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1) {
		ready = true
		if obj_player2.ready {
			room_goto(Room1)
		}
	}
}

if room == Room1 {
	if !instance_exists(chara) {
		instance_create_layer(64, 500, "Instances", chara)
		with chara {
			player = 0
			enemy = obj_player2.chara
			if hp <= 0 {
				obj_player2.p2_score += 1
				room_restart()
			}
		}
	}
}


