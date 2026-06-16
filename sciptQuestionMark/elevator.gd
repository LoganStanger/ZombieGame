extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("loganArea") and Booyah.keycardyep:
		if Booyah.TrueDashing == true and Booyah.IsDashing == false:
			Booyah.TrueDashing = false
			Booyah.walk_speed += 5000
			Booyah.run_speed += 5000
		if Booyah.TrueDashing == true and Booyah.IsDashing == true:
			Booyah.TrueDashing = false
			Booyah.walk_speed -= 45000
			Booyah.run_speed -= 45000
			Booyah.IsDashing = false
		if Booyah.level == 10:
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Kentucky.tscn")
		else:
			Booyah.level += 1
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/regent.tscn")
