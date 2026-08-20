extends AnimatedSprite2D
@onready var animated_sprite_2d = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play("default")
