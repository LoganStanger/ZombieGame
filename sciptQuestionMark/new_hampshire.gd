extends AnimatedSprite2D
@onready var animated_sprite_2d = $"."

func _ready() -> void:
	animated_sprite_2d.play("FinallyHere")
	await get_tree().create_timer(4).timeout
	animated_sprite_2d.play("CryingZombie")
	await get_tree().create_timer(5).timeout
	animated_sprite_2d.play("Dad")
	await get_tree().create_timer(3).timeout
	Booyah.curtainTwice = true
