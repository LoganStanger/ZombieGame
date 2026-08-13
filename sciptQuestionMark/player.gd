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
	if Booyah.Leaving:
		queue_free()
	Booyah.global_position = position
	Booyah.global_positionX = position.x
	Booyah.global_positionY = position.y
	if Booyah.hunger == 0:
		NoMove = true
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

func _on_logan_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("ActualMo"):
		dying = false

func _on_timer_timeout() -> void:
	if dying == true and Booyah.hunger != 0:
		Booyah.hunger -= 5
