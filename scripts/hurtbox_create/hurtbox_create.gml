function hurtbox_create(xscale, yscale, xoffset, yoffset, owner) {
	_hurtbox = instance_create_layer(x + xoffset, y + yoffset, "boxes", obj_hurtbox)
	_hurtbox.owner = owner
	_hurtbox.image_xscale = xscale
	_hurtbox.image_yscale = yscale
	_hurtbox.x_offset = xoffset
	_hurtbox.y_offset = yoffset


	return _hurtbox

}


