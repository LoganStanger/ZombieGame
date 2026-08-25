extends AnimatedSprite2D
@onready var animated_sprite_2d = $"."

func _ready() -> void:
	animated_sprite_2d.play("FirstScene")
	await get_tree().create_timer(5).timeout
	animated_sprite_2d.play("SecondScene")
	await get_tree().create_timer(5).timeout
	animated_sprite_2d.play("ThirdScene")
	await get_tree().create_timer(6.9).timeout
	animated_sprite_2d.play("FourthScene")
	await get_tree().create_timer(2).timeout
	Booyah.curtainFinal = true
