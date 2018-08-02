extends HSlider

func _on_NumOrbitsSlider_value_changed(value):
	$"../Orbits".set_num_circles(value)
