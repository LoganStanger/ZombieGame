extends Button

func _on_pressed() -> void:
	Booyah.level = 1
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
