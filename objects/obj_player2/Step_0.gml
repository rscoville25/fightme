if room == room_select {
	if select_chara == 0 && obj_player1.chara != obj_shoto {
		chara = obj_shoto
	} else if select_chara == 0 {
		chara = obj_shoto2
	}
	
	if keyboard_check_pressed(ord("F")) || gamepad_button_check_pressed(1, gp_face1) {
		ready = true
		if obj_player1.ready {
			room_goto(Room1)
		}
	}
}

if room == Room1 {
	if !instance_exists(chara) {
		instance_create_layer(1000, 500, "Instances", chara)
		with chara {
			player = 1
			enemy = obj_player1.chara
		}
	}
	if chara.hp <= 0 {
		obj_player1.p1_score += 1
		room_restart()
	}
}


