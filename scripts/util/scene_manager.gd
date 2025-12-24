extends Node

@export var scenes: Dictionary[String, PackedScene] = {}

func load_scene(scene: String) -> void:
	var packed = scenes.get(scene)
	if not packed:
		return
	load_packed(packed)

func load_packed(scene: PackedScene) -> void:
	get_tree().change_scene_to_packed(scene)
	GameManager.stop_ambience()
