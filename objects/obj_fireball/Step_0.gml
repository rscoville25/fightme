owner.dmg_delt = dmg_delt


if owner.dir_facing = 0 {
	x += fireball_spd
	image_xscale = 1
	if x >= start_travel + 600 {
		instance_destroy()
	}

} else {
	x -= fireball_spd
	image_xscale = -1
	if x <= start_travel - 600 {
		instance_destroy()
	}

}

with hitbox {
	x = other.x + x_offset
	y = other.y + y_offset
	if (place_meeting(x, y, other.owner.enemy.hurtbox)) && did_hit == false {
		if other.owner.enemy.vuln {
			other.owner.enemy.hp -= other.dmg_delt
			other.owner.enemy.stunned += other.stun
		} else {
			other.owner.enemy.hp -= other.dmg_delt / 10
		}
		instance_destroy()
	}
	
}

if !instance_exists(hitbox) {
	instance_destroy()
}



