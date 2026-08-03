extends CharacterBody2D

var LoganScrewYou = false
var speed = 1
var gudck = false
func _physics_process(_delta: float) -> void:
	if LoganScrewYou == true:
		self.position.x = move_toward(self.position.x, $"../Player".global_position.x, -speed)
		self.position.y = move_toward(self.position.y, $"../Player".global_position.y, -speed)
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

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Spotlight"):
		LoganScrewYou = true
