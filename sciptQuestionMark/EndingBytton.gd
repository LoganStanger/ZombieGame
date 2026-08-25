extends Button

func _ready() -> void:
	self.modulate.a = 0

func _process(_delta: float) -> void:
	if Booyah.curtainFinal:
		self.modulate.a += 0.01
	if self.modulate.a >= 1:
		self.modulate.a = 1

func _on_pressed() -> void:
	if self.modulate.a == 1:
		Booyah.level = 1
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
