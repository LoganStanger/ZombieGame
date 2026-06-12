extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Booyah.hunger > 200:
		Booyah.hunger = 200
		#if hunger drops below zero, brings it back up to zero and makes fail state.
	if Booyah.hunger < 0:
		Booyah.hunger = 0
		Booyah.hungrySad = true
		
	if Booyah.fallingHungry == 0:
		Booyah.level = 0

#code to decrease hunger and boredom
func _on_timer_timeout() -> void:
	if Booyah.hungrySad == false:
		Booyah.boredom -= 1
		Booyah.hunger -= Booyah.hungerSpeed
