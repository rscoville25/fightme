if hp <= 0 {
	game_restart()
}

with hurtbox {
	if place_meeting(x, y, obj_hitbox) && obj_hitbox.owner != owner {
		other.hp -= other.enemy.dmg_delt
	}
}

