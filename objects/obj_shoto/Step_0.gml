// defines buttons used for basic movement
var _up_pressed, _down_pressed, _left_pressed, _right_pressed, _light_pressed, _medium_pressed, _heavy_pressed, _special_pressed
if player == 0 {
	if gamepad_is_connected(0) {
		_up_pressed = gamepad_button_check(0, gp_padu)
		_down_pressed = gamepad_button_check(0, gp_padd)
		_left_pressed = gamepad_button_check(0, gp_padl)
		_right_pressed = gamepad_button_check(0, gp_padr)
		_light_pressed = gamepad_button_check_pressed(0, gp_face3)
		_medium_pressed = gamepad_button_check_pressed(0, gp_face1)
		_heavy_pressed = gamepad_button_check_pressed(0, gp_face4)
		_special_pressed = gamepad_button_check(0, gp_face2)
	} else {
		_up_pressed = keyboard_check(vk_up)
		_down_pressed = keyboard_check(vk_down)
		_left_pressed = keyboard_check(vk_left)
		_right_pressed = keyboard_check(vk_right)
		_light_pressed = keyboard_check_pressed(ord("A"))
		_medium_pressed = keyboard_check_pressed(ord("Z"))
		_heavy_pressed = keyboard_check_pressed(ord("S"))
		_special_pressed = keyboard_check_pressed(ord("X"))
	}
} else if player == 1 {
	if gamepad_is_connected(1) {
		_up_pressed = gamepad_button_check(1, gp_padu)
		_down_pressed = gamepad_button_check(1, gp_padd)
		_left_pressed = gamepad_button_check(1, gp_padl)
		_right_pressed = gamepad_button_check(1, gp_padr)
		_light_pressed = gamepad_button_check_pressed(1, gp_face3)
		_medium_pressed = gamepad_button_check_pressed(1, gp_face1)
		_heavy_pressed = gamepad_button_check_pressed(1, gp_face4)
		_special_pressed = gamepad_button_check(1, gp_face2)
	} else {
		_up_pressed = keyboard_check(ord("I"))
		_down_pressed = keyboard_check(ord("K"))
		_left_pressed = keyboard_check(ord("J"))
		_right_pressed = keyboard_check(ord("L"))
		_light_pressed = keyboard_check_pressed(ord("R"))
		_medium_pressed = keyboard_check_pressed(ord("F"))
		_heavy_pressed = keyboard_check_pressed(ord("T"))
		_special_pressed = keyboard_check_pressed(ord("G"))
	}
}

if stunned <= 0 {
	stun_state = false
} else {
	stun_state = true
}
if !stun_state {
	if enemy.combo > 1 {
		enemy.last_combo = enemy.combo
	}
	enemy.combo = 0
	
	if enemy.x > x {
		dir_facing = 0
		image_xscale = 3
	}

	if enemy.x < x {
		dir_facing = 1
		image_xscale = -3
	}

	if _left_pressed && dir_facing = 0 {
		vuln = false
	} else if _right_pressed && dir_facing = 1 {
		vuln = false
	} else {
		vuln = true
	}

	// he needs to walk somehow
	if obj_system.turbo {
		shoto_spd = 20	
	} else {
		shoto_spd = 10
	}
	move_x = (_right_pressed - _left_pressed) * shoto_spd
	if grounded {
		if !place_meeting(x + move_x, y, enemy) {
			if _down_pressed || attacking {
				x += 0
			} else if x <= 39 && move_x < 0 {
				x += 0
			} else if x >= room_width - 39 && move_x > 0 {
				x += 0 
			} else {
				x += move_x

			}
		} 
	} else {
		if !place_meeting(x + move_x, y + jump_dir, enemy) {
			if x <= 39 && jump_dir < 0 {
				x += 0
			} else if x >= room_width - 39 && jump_dir > 0 {
				x += 0 
			} else {
				x += shoto_spd * jump_dir

			}
		} else {
			if enemy.x > x {
				x -= 10
			} else if enemy.x < x {
				x += 10
			}
		}			
	}
	

	if !grounded {
		grav += .5
	}



	if (place_meeting(x, y + 2, obj_ground)) {
		grounded = true
		move_y = 0;
		if (_up_pressed) {
			grav = 0
			move_y = -jump_spd
			jump_dir = _right_pressed - _left_pressed
		}
	
	} else if (move_y < 10) {
			move_y += grav + 1
			grounded = false
	}

	y += move_y

	// change sprites for each action
	if !attacking {
		sprite_index = spr_shoto_idle
		if _left_pressed || _right_pressed {
			sprite_index = spr_shoto_walk
		}

		if _down_pressed {
			sprite_index = spr_shoto_crouch
		}
	}

	if !grounded {
		sprite_index = spr_shoto_crouch

	}



	if _special_pressed {
		if !attacking && stunned <= 0 {
			if _left_pressed || _right_pressed {

			} else {
				attack_start = obj_system.framecount
				attack_5s = true
				attacking = true	
			}
		}
	}


	if attack_5s {
		if obj_system.framecount < attack_start + 16 {
			sprite_index = spr_shoto_fireball
		} 
		if obj_system.framecount == attack_start + 16 {
			if !instance_exists(obj_fireball) {
				instance_create_layer(x + 39, y - 16, "Instances", obj_fireball)
				with obj_fireball {
					obj_fireball.owner = obj_shoto
				}
			}
		}
		
		if _light_pressed && obj_system.framecount > attack_start + 16 && obj_system.framecount <= attack_start + 32 {
			attack_5s = false
			attack_5l = true
		}
		if _medium_pressed && obj_system.framecount > attack_start + 16 && obj_system.framecount <= attack_start + 32 {
			attack_5s = false
			attack_5m = true
		}
		if _heavy_pressed && obj_system.framecount > attack_start + 16 && obj_system.framecount <= attack_start + 32 {
			attack_5s = false
			attack_5h = true
		}
	
		if obj_system.framecount > attack_start + 32 {
			attack_5s = false
			attacking = false

		}
	}

	if _light_pressed {
		if !attacking && stunned <= 0 {
			attack_start = obj_system.framecount
			attack_5l = true
			attacking = true
		}
	}



	if attack_5l && grounded {
		if obj_system.framecount <= attack_start + 4 {
			sprite_index = spr_shoto_5L
		} 
	
		if obj_system.framecount <= attack_start + 7 && obj_system.framecount > attack_start + 4 {
			dmg_delt = 10
			stun = 11
			hitbox = hitbox_create(25 * image_xscale, 11 * image_yscale, 25 * image_xscale, -29 * image_yscale, 3, stun, obj_shoto)

		}
		
		if _light_pressed && obj_system.framecount > attack_start + 7 && obj_system.framecount <= attack_start + 14 {
			attack_5l = false
			attack_5l = true
		}
	
		if obj_system.framecount > attack_start + 14 {
			dmg_delt = 0
			attack_5l = false
			attacking = false
		}
	}

	if attack_5l && !grounded {
		if obj_system.framecount <= attack_start + 6 {
			sprite_index = spr_shoto_jl
		}
		if obj_system.framecount <= attack_start + 16 && obj_system.framecount > attack_start + 6 {
			dmg_delt = 10
			stun = 22
			hitbox = hitbox_create(44 * image_xscale, 15 * image_yscale, -20 * image_xscale, 28 * image_yscale, 10, stun, obj_shoto)

		}
		if obj_system.framecount > attack_start + 16 {
			dmg_delt = 0
			attack_5l = false
			attacking = false
		}
	}
	
	if _medium_pressed {
		if !attacking && stunned <= 0 {
			attack_start = obj_system.framecount
			attack_5m = true
			attacking = true
		}
	}
	
	if attack_5m && grounded {
		if obj_system.framecount <= attack_start + 6 {
			sprite_index = spr_shoto_5M
		} 
	
		if obj_system.framecount <= attack_start + 10 && obj_system.framecount > attack_start + 6 {
			dmg_delt = 15
			stun = 17
			hitbox = hitbox_create(25 * image_xscale, 11 * image_yscale, 25 * image_xscale, -20 * image_yscale, 4, stun, obj_shoto)

		}
		
		if _light_pressed && obj_system.framecount > attack_start + 10 && obj_system.framecount <= attack_start + 21 {
			attack_5m = false
			attack_5l = true
		}
	
		if obj_system.framecount > attack_start + 21 {
			dmg_delt = 0
			attack_5m = false
			attacking = false
		}
	}	
	
	if _heavy_pressed {
		if !attacking && stunned <= 0 {
			attack_start = obj_system.framecount
			attack_5h = true
			attacking = true
		}
	}
	
	if attack_5h && grounded {
		if obj_system.framecount <= attack_start + 10 {
			sprite_index = spr_shoto_5H
		}
		
		if obj_system.framecount <= attack_start + 15 && obj_system.framecount > attack_start + 10 {
			dmg_delt = 16
			stun = 21
			if enemy.x > x {
				dir_facing = 0
				image_xscale = 3
				if x <= 39 {
					x -= 0
			
				} else {
					x += 1
				}

			}

			if enemy.x < x {
				dir_facing = 1
				image_xscale = -3
				if x >= room_width - 39 {
					x += 0
			
				} else {
					x -= 1
				}
			}
			hitbox = hitbox_create(25 * image_xscale, 11 * image_yscale, 25 * image_xscale, -20 * image_yscale, 5, stun, obj_shoto)
		}

		if _light_pressed && obj_system.framecount > attack_start + 15 && obj_system.framecount <= attack_start + 33 {
			attack_5h = false
			attack_5l = true
		}
		
		if _medium_pressed && obj_system.framecount > attack_start + 15 && obj_system.framecount <= attack_start + 33 {
			attack_5h = false
			attack_5m = true
		}
		
		if obj_system.framecount >  attack_start + 33 {
			dmg_delt = 0
			attack_5h = false
			attacking = false
		}
	}
	
} else {
	sprite_index = spr_shoto_stun
	if enemy.x > x {
		dir_facing = 0
		image_xscale = 3
		if x <= 39 {
			x -= 0
			
		} else {
			x -= enemy.dmg_delt * 0.1
		}

	}

	if enemy.x < x {
		dir_facing = 1
		image_xscale = -3
		if x >= room_width - 39 {
			x += 0
			
		} else {
			x += enemy.dmg_delt * 0.1
		}
	}
}

with hurtbox {
	x = other.x + x_offset
	y = other.y + y_offset
	
	
	if place_meeting(x, y, obj_hitbox) && !place_meeting(x, y, other.hitbox) && !other.attack_5s && other.vuln {
		audio_play_sound(snd_hit, 10, false, 0.5)
		other.stunned = 0
		other.hp -= other.enemy.dmg_delt
		other.stunned += other.enemy.stun
		if other.stun_state {
			other.enemy.combo += 1
		}
		if other.enemy.super < other.enemy.max_super {
			other.enemy.super += other.enemy.dmg_delt / 3
		}
	}
	if place_meeting(x, y, obj_hitbox) && !place_meeting(x, y, other.hitbox) && !other.vuln {
		audio_play_sound(snd_hit, 10, false, 0.5)
		other.sprite_index = spr_shoto_block
		other.hp -= other.enemy.dmg_delt / 10
		if other.super < other.max_super {
			other.super += other.enemy.dmg_delt / 3
		}
	}
}


