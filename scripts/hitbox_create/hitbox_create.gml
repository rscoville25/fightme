function hitbox_create(xscale, yscale, xoffset, yoffset, active, owner, hitstun) {
	_hitbox = instance_create_layer(x + xoffset, y + yoffset, "boxes", obj_hitbox)
	_hitbox.owner = owner
	_hitbox.image_xscale = xscale
	_hitbox.image_yscale = yscale
	_hitbox.x_offset = xoffset
	_hitbox.y_offset = yoffset
	_hitbox.active = active
	_hitbox.hitstun = hitstun


	return _hitbox
}