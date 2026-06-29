extends CharacterBody2D

const speed = 20
var player = preload("res://prefabs/playertwo.tscn")
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = $"../CharacterBody2D2".global_position

func _on_timer_timeout() -> void:
	makepath()
