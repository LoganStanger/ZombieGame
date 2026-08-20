extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.play("Idle")
	
func _physics_process(delta: float) -> void:
	pass
