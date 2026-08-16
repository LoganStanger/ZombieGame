extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$TextureRect/TextureRect/ProgressBar.value = Booyah.hunger
