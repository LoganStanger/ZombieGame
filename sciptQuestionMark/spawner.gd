extends Node2D
var RobotSpawnTemp = Booyah.RobotSpawn
var mynode = preload("res://prefabs/robot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(Booyah.RobotSpawn).timeout
	Logan()

func Logan():
	if RobotSpawnTemp != 1:
		RobotSpawnTemp -= 0.5
	Inst()
	await get_tree().create_timer(RobotSpawnTemp).timeout
	Logan()

func Inst():
	var instance = mynode.instantiate()
	add_child(instance)
