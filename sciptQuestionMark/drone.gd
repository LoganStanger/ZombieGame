extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

const speed = 0.8

func _ready() -> void:
	animated_sprite_2d.play("Moving")
func _physics_process(_delta: float) -> void:
	if Booyah.Leaving:
		queue_free()
	look_at(Booyah.global_position)
	self.global_position.x = move_toward(self.global_position.x, Booyah.global_positionX, speed)
	self.global_position.y = move_toward(self.global_position.y, Booyah.global_positionY, speed)
	move_and_slide()
