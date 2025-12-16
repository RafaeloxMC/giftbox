extends Control

@onready var animated_sprite_2d: AnimatedSprite2D = $Components/Gift/AnimatedSprite2D

func _on_gui_input(event: InputEvent) -> void:
	if event.is_action("lmb"):
		animated_sprite_2d.play("open")
