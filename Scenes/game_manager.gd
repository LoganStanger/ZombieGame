extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#keycard code
	if Booyah.gdevelopholdover == true and :
		pass
	
	
	if Booyah.hunger < 0:
		get_tree().change_scene_to_file("")



#code to decrease hunger
func _on_timer_timeout() -> void:
	Booyah.hunger -= Booyah.hungerSpeed
