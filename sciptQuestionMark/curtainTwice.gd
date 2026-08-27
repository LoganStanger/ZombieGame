extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Booyah.curtainTwice:
		self.modulate.a += 0.02
	if self.modulate.a >= 1:
		var big = randi_range(1,11)
		if big == 1:
			get_tree().change_scene_to_file("res://Scenes/firstScene.tscn")
		if big == 2:
			get_tree().change_scene_to_file("res://Scenes/secondScene.tscn")
		if big == 3:
			get_tree().change_scene_to_file("res://Scenes/thirdScene.tscn")
		if big == 4:
			get_tree().change_scene_to_file("res://Scenes/fourthScene.tscn")
		if big == 5:
			get_tree().change_scene_to_file("res://Scenes/fifthScene.tscn")
		if big == 6:
			get_tree().change_scene_to_file("res://Scenes/sixthScene.tscn")
		if big == 7:
			get_tree().change_scene_to_file("res://Scenes/seventhScene.tscn")
		if big == 8:
			get_tree().change_scene_to_file("res://Scenes/eighthScene.tscn")
		if big == 9:
			get_tree().change_scene_to_file("res://Scenes/ninthScene.tscn")
		if big == 10:
			get_tree().change_scene_to_file("res://Scenes/tenthScene.tscn")
		if big == 11:
			get_tree().change_scene_to_file("res://Scenes/eleventhScene.tscn")
