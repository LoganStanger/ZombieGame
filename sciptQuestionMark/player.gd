extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

var dying = false
var NoMove = false
var gudck = false
var IsSprinting: bool = false
var Emoting = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Booyah.fallingHungry = Booyah.walk_speed
	NoMove = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	Booyah.global_position = position
	Booyah.global_positionX = position.x
	Booyah.global_positionY = position.y
	if Booyah.hunger == 0:
		NoMove = true
	if Input.is_action_just_pressed("ZombieBite") and Booyah.TrueDashing == false and NoMove == false:
		Booyah.TrueDashing = true
		animated_sprite_2d.play("Biting")
		Booyah.walk_speed -= 5000
		Booyah.run_speed -= 5000
		await get_tree().create_timer(0.3).timeout
		Booyah.IsDashing = true
		Booyah.hunger -= 50
		Booyah.walk_speed += 50000
		Booyah.run_speed += 50000
		await get_tree().create_timer(0.1).timeout
		Booyah.walk_speed -= 45000
		Booyah.run_speed -= 45000
		Booyah.IsDashing = false
		Booyah.TrueDashing = false
	if Booyah.IsDashing and gudck:
		Booyah.hunger += 100
	if	NoMove == true and Booyah.fallingHungry > 0:
		Booyah.fallingHungry -= 400
		var dir = Input.get_vector("ZombieLeft", "ZombieRight", "ZombieUp", "ZombieDown")
		velocity = dir * Booyah.fallingHungry * delta
	if NoMove == false and Booyah.fallingHungry < Booyah.walk_speed:
		Booyah.fallingHungry += 400
	if Booyah.fallingHungry > Booyah.walk_speed:
		Booyah.fallingHungry = Booyah.walk_speed
	if Booyah.fallingHungry < 0:
		Booyah.fallingHungry = 0
	if Booyah.fallingHungry == 0 and NoMove == true:
		velocity = Vector2(0,0)
	
	
	if Input.is_action_just_pressed("ZombieSprint") and IsSprinting == false and NoMove == false:
		IsSprinting = true
		Booyah.hungerSpeed += 1
	if Input.is_action_just_released("ZombieSprint") and IsSprinting == true and NoMove == false:
		IsSprinting = false
		Booyah.hungerSpeed -= 1
	
	if velocity == Vector2(0,0) and Emoting == false:
			animated_sprite_2d.play("Idle")
	if IsSprinting == false and NoMove == false:
		var dir = Input.get_vector("ZombieLeft", "ZombieRight", "ZombieUp", "ZombieDown")
		velocity = dir * Booyah.walk_speed * delta
		if velocity != Vector2(0,0) and Emoting == false:
			animated_sprite_2d.play("Walking")
	if IsSprinting == true and NoMove == false:
		var dir = Input.get_vector("ZombieLeft", "ZombieRight", "ZombieUp", "ZombieDown")
		velocity = dir * Booyah.run_speed * delta
		if velocity != Vector2(0,0) and Emoting == false:
			animated_sprite_2d.play("Walking")
		
	
	if Booyah.hunger == 0:
		NoMove = true
	else:
		NoMove = false
	
	move_and_slide()

func _on_logan_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("ActualMo"):
		dying = true
		print("Logan")
	if area.is_in_group("enemies") and gudck == false:
		area.get_parent().gudck = true
		gudck = true

func _on_logan_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("ActualMo"):
		dying = false
	if area.is_in_group("enemies") and gudck:
		area.get_parent().gudck = false
		gudck = false

func _on_timer_timeout() -> void:
	if dying == true:
		Booyah.hunger -= 5
