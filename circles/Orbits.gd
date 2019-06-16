extends ColorRect

func add_more_orbits():
	print("added another 256 orbits")
	var orbit = $Orbit1.duplicate()
	orbit.offset += 50 * get_children().size()
	orbit.set_material($Orbit1.get_material().duplicate())
	add_child(orbit)



func _on_ColorRect_resized():
	if ($Orbit1.rect_size.x < rect_size.x + 50 || $Orbit1.rect_size.y < rect_size.y + 50):
		for orbit in get_children():
			orbit.rect_size = rect_size + Vector2(200, 200)
			orbit.refresh()
	
	


func set_num_circles(value):
	var num_circles = int(value)
	if num_circles > get_children().size() * 256:
		add_more_orbits()
	var children = get_children()
	for i in range(0, children.size()):
		if num_circles <= 256 * i:
			children[i].hide()
		else:
			children[i].show()
			children[i].set_num_circles(min(num_circles - 256 * i, 256))
		
