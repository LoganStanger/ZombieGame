extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

var LoganScrewYou = false
var speed = 1
var gudck = false

func _ready() -> void:
	var skin = randi_range(1,5)
	if skin == 1:
		animated_sprite_2d.play("HumanOne")
	if skin == 2:
		animated_sprite_2d.play("HumanTwo")
	if skin == 3:
		animated_sprite_2d.play("HumanThree")
	if skin == 4:
		animated_sprite_2d.play("HumanFour")
	if skin == 5:
		animated_sprite_2d.play("HumanFive")
func _physics_process(_delta: float) -> void:
	if Booyah.Leaving:
		queue_free()
	if LoganScrewYou == true:
		self.position.x = move_toward(self.position.x, $"../Player".global_position.x, -speed)
		self.position.y = move_toward(self.position.y, $"../Player".global_position.y, -speed)
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("loganArea"):
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
		Booyah.hunger += 100
		queue_free()
	if area.is_in_group("Spotlight"):
		LoganScrewYou = true
