extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

const speed = 1

func _ready() -> void:
	animated_sprite_2d.play("Moving")
func _physics_process(_delta: float) -> void:
	look_at($"../Player".global_position)
	self.position.x = move_toward(self.position.x, $"../Player".global_position.x, speed)
	self.position.y = move_toward(self.position.y, $"../Player".global_position.y, speed)
	move_and_slide()
