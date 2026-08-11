extends CharacterBody2D

const speed = 250
@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.play("default")
	
func _physics_process(_delta: float) -> void:
	if Booyah.Leaving:
		queue_free()
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = Booyah.global_position

func _on_timer_timeout() -> void:
	makepath()
