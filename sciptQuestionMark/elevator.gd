extends AnimatedSprite2D
@onready var animated_sprite_2d = $"."

func _ready() -> void:
	animated_sprite_2d.play("Door closing")
	await $".".animation_finished
	animated_sprite_2d.play("Door closed")
	
func _physics_process(_delta: float) -> void:
	if Booyah.keycardyep:
		animated_sprite_2d.play("Door opening")
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("loganArea") and Booyah.keycardyep:
		if Booyah.hungerSpeed > 1:
			Booyah.hungerSpeed = 1
		if Booyah.level == 10:
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Kentucky.tscn")
		else:
			Booyah.level += 1
			Booyah.Leaving = true
			await get_tree().create_timer(2).timeout
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Regent.tscn")
