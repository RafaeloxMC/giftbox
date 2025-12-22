extends Control

@onready var board: Board = $Board
@onready var components: Node2D = $Board/Components
@onready var simulator: Node = $Simulator
@onready var hint_label: Label = $UI/HintLabel
@onready var note: Label = $UI/Note

func _on_run_pressed() -> void:
	var comps = components.get_children()
	simulator.evaluate(comps)
	hint_label.text = "Simulation complete"


func _on_clear_pressed() -> void:
	var comps = components.get_children()
	simulator.clear(comps)
	board.queue_redraw()
	hint_label.text = "Board cleared"


func _on_hint_pressed() -> void:
	note.visible = !note.visible
