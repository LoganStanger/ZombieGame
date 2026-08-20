extends TextEdit

var flip = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if flip == true:
		Booyah.hunger -= 1
	if Booyah.hunger == 0:
		flip = false
	if flip == false:
		Booyah.hunger += 1
	if Booyah.hunger == 200:
		flip = true
