extends Button


func _on_pressed() -> void:
	if Booyah.newbie:
		Booyah.newbie = false
		get_tree().change_scene_to_file("res://Scenes/Tutorial.tscn")
	else:
		pass
		#replace with sprite 2d
