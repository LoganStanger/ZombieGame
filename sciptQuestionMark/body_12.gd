extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Booyah.level == 6:
		queue_free()
	if Booyah.level == 8:
		queue_free()
	if Booyah.level == 9:
		queue_free()
