extends Control

@onready var animated_sprite_2d: AnimatedSprite2D = $Components/Gift/AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_gui_input(event: InputEvent) -> void:
	if event.is_action("lmb"):
		animated_sprite_2d.play("open")
		await get_tree().create_timer(0.75).timeout
		animation_player.play("switch_scene")

func load_main_menu():
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
