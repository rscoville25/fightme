// move the dude
if obj_system.turbo {
	shoto_spd = 20	
} else {
	shoto_spd = 10
}
move_x = 0
dir_facing = 0
grounded = true
move_y = 0
jump_spd = 45
jump_dir = 0
grav = 0

attack_start = 0
attack_5s = false
attack_5l = false
attack_5m = false
attack_5h = false
stun = 7
attacking = false
combo = 0
last_combo = combo

if instance_exists(obj_dummy) {
	enemy = obj_dummy
}

player = 0

image_xscale = 3.4
image_yscale = 3

hp = 1000
dmg_delt = 0

stun_state = false
stunned = 0
vuln = true

//hurtbox
hitbox = 0
hurtbox = hurtbox_create(50 * image_xscale, 93 * image_yscale , -21 *image_xscale, -45 * image_yscale, obj_shoto)
