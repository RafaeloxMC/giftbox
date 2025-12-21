extends Node2D
class_name Component

@export var component_name := ""
@export var pins: Array[Pin] = []

func get_pins() -> Array[Pin]:
	print("Called get_pins for " + self.name)
	return pins
