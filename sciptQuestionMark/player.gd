extends CharacterBody2D

var IsDashing: bool = false
var IsSprinting: bool = false
var TrueDashing: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ZombieBite"):
		
		await get_tree().create_timer(0.1).timeout
		IsDashing = true
		Booyah.walk_speed += 500000
		Booyah.run_speed += 500000
		await get_tree().create_timer(0.1).timeout
		Booyah.walk_speed -= 500000
		Booyah.run_speed -= 500000
		IsDashing = false
		
		
	if Input.is_action_just_pressed("ZombieSprint") and IsSprinting == false:
		IsSprinting = true
		Booyah.hungerSpeed += 1
	if Input.is_action_just_released("ZombieSprint") and IsSprinting == true:
		IsSprinting = false
		Booyah.hungerSpeed -= 1
		
	if IsSprinting == false:
		var dir = Input.get_vector("ZombieLeft", "ZombieRight", "ZombieUp", "ZombieDown")
		velocity = dir * Booyah.walk_speed * delta
	if IsSprinting == true:
		var dir = Input.get_vector("ZombieLeft", "ZombieRight", "ZombieUp", "ZombieDown")
		velocity = dir * Booyah.run_speed * delta
	
	
	move_and_slide()
