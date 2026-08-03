extends Node2D
var DroneSpawnTemp = Booyah.DroneSpawn
var mynode = preload("res://prefabs/Drone.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(Booyah.DroneSpawn).timeout
	Logan()

func Logan():
	if DroneSpawnTemp != 1:
		DroneSpawnTemp -= 0.5
	Inst()
	await get_tree().create_timer(DroneSpawnTemp).timeout
	Logan()

func Inst():
	var instance = mynode.instantiate()
	add_child(instance)
