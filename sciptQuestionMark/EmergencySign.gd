extends AnimatedSprite2D
@onready var animated_sprite_2d = $"."

func _ready() -> void:
	animated_sprite_2d.play("Emergency")

func _process(_delta: float) -> void:
	if Booyah.dying:
		show()
	else:
		hide()
