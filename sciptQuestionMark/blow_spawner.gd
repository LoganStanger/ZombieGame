extends Node2D
var BlowSpawnTemp = Booyah.BlowSpawn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(Booyah.BlowSpawn).timeout
	Logan()

func Logan():
	BlowSpawnTemp -= 0.5
	print("Butt")
	await get_tree().create_timer(BlowSpawnTemp).timeout
	Logan()
