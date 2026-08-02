extends Node2D
var RobotSpawnTemp = Booyah.RobotSpawn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(Booyah.RobotSpawn).timeout
	Logan()

func Logan():
	RobotSpawnTemp -= 0.5
	print("Butter")
	await get_tree().create_timer(RobotSpawnTemp).timeout
	Logan()
