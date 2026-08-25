extends Sprite2D

func _ready() -> void:
	self.modulate.a = 0

func _process(_delta: float) -> void:
	if Booyah.curtainFinal:
		self.modulate.a += 0.01
