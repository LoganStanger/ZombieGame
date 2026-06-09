extends CharacterBody2D


var gudck = false
var IsSprinting: bool = false
var TrueDashing: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Booyah.fallingHungry = Booyah.walk_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ZombieBite") and TrueDashing == false and Booyah.hungrySad == false:
		TrueDashing = true
		Booyah.walk_speed -= 5000
		Booyah.run_speed -= 5000
		await get_tree().create_timer(0.2).timeout
		Booyah.IsDashing = true
		Booyah.hunger -= 50
		Booyah.walk_speed += 50000
		Booyah.run_speed += 50000
		await get_tree().create_timer(0.15).timeout
		Booyah.walk_speed -= 45000
		Booyah.run_speed -= 45000
		Booyah.IsDashing = false
		TrueDashing = false
	if Booyah.IsDashing and gudck:
		Booyah.hunger += 100
	if Booyah.hungrySad == true:
		Booyah.fallingHungry -= 1
		var dir = Input.get_vector("ZombieLeft", "ZombieRight", "ZombieUp", "ZombieDown")
		velocity = dir * Booyah.fallingHungry * delta
	
	if Input.is_action_just_pressed("ZombieSprint") and IsSprinting == false and Booyah.hungrySad == false:
		IsSprinting = true
		Booyah.hungerSpeed += 1
	if Input.is_action_just_released("ZombieSprint") and IsSprinting == true and Booyah.hungrySad == false:
		IsSprinting = false
		Booyah.hungerSpeed -= 1
		
	if IsSprinting == false and Booyah.hungrySad == false:
		var dir = Input.get_vector("ZombieLeft", "ZombieRight", "ZombieUp", "ZombieDown")
		velocity = dir * Booyah.walk_speed * delta
	if IsSprinting == true and Booyah.hungrySad == false:
		var dir = Input.get_vector("ZombieLeft", "ZombieRight", "ZombieUp", "ZombieDown")
		velocity = dir * Booyah.run_speed * delta
	
	
	move_and_slide()


func _on_logan_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies") and gudck == false:
		area.get_parent().gudck = true
		gudck = true

func _on_logan_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("enemies") and gudck:
		gudck = false
