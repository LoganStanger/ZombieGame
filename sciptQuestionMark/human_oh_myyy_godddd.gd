extends CharacterBody2D

var gudck = false
func _physics_process(delta: float) -> void:
		if Booyah.IsDashing and gudck:
			if randi_range(1,100) > Booyah.chancekeycard:
				Booyah.keycardyep = true
			Booyah.population -= 1
			if Booyah.population == 4:
				Booyah.chancekeycard = 80
			if Booyah.population == 3:
				Booyah.chancekeycard = 68
			if Booyah.population == 2:
				Booyah.chancekeycard = 50
			if Booyah.population == 1:
				Booyah.chancekeycard = 0
			queue_free()
		move_and_slide()
