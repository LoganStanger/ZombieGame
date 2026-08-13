extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.modulate.a = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Booyah.hunger == 0 and Booyah.fallingHungry == 0:
		await get_tree().create_timer(2.5).timeout
		self.modulate.a += 0.02

func _on_button_pressed() -> void:
	Booyah.level = 1
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
