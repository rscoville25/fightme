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
		other.owner.enemy.hp -= other.dmg_delt
		other.owner.enemy.stunned += other.stun
		instance_destroy()
	}
	
}

if !instance_exists(hitbox) {
	instance_destroy()
}



