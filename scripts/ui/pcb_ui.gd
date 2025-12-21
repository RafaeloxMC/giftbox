extends Control

@onready var board: Board = $Board
@onready var components: Node2D = $Board/Components
@onready var simulator: Node = $Simulator
@onready var hint_label: Label = $UI/HintLabel

func _on_run_pressed() -> void:
	var comps = components.get_children()
	simulator.evaluate(comps)
	hint_label.text = "Simulation complete"


func _on_clear_pressed() -> void:
	pass # Replace with function body.


func _on_hint_pressed() -> void:
	pass # Replace with function body.
