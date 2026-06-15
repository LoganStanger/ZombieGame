extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Booyah.fallingHungry == 0:
		show()

func _on_button_pressed() -> void:
	if Booyah.hungrySad == true and Booyah.fallingHungry == 0:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
