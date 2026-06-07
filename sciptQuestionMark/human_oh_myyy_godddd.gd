extends CharacterBody2D

var gudck = false
func _physics_process(delta: float) -> void:
	if Booyah.IsDashing and gudck:
		Booyah.population -= 1
		if randi_range(1,100) > Booyah.population*24:
			Booyah.keycardyep = true
		queue_free()
	
	
	move_and_slide()
