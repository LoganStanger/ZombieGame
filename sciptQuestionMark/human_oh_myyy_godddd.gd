extends CharacterBody2D

var gudck = false
func _physics_process(delta: float) -> void:
	if Booyah.IsDashing and gudck:
		Booyah.gdevelopholdover = true
		Booyah.population -= 1
		queue_free()
	
	move_and_slide()
