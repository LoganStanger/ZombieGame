extends Sprite2D
@onready var animated_sprite_2d = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var big = randi_range(1,5)
	animated_sprite_2d.play("default")
	await get_tree().create_timer(6).timeout
	if big == 1:
		get_tree().change_scene_to_file("res://Scenes/firstScene.tscn")
	if big == 2:
		pass
	if big == 3:
		pass
	if big == 4:
		pass
	if big == 5:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.y += 2
	
