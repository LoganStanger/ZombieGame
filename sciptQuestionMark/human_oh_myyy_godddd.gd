extends CharacterBody2D

var gudck = false
func _physics_process(delta: float) -> void:
	if Booyah.IsDashing == true and Booyah.gudck == true:
		print("Eaten")
		queue_free()
	
	move_and_slide()
