active -= 1
if obj_system.boxes_vis {
	visible = true
}
if active <= 0 {
	instance_destroy()
}

