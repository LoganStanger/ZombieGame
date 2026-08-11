extends Sprite2D

var mugh = true
var ough = false
var counterough = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _physics_process(_delta: float) -> void:
	if counterough == 150:
		ough = true
		mugh = false
	if mugh:
		self.modulate.a -= 0.01
		counterough += 1
	if ough:
		self.modulate.a += 0.01
