extends Area2D
class_name Pin

var connections: Array[Pin] = []

signal clicked(pin: Pin)

var clicked_state: bool = false

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and not clicked_state:
		clicked.emit(self)
		clicked_state = true
		print("PIN CLICKED " + self.name + " for " + self.get_parent().get_parent().name)

func connect_to(other: Pin):
	if other == self:
		return
	if other not in connections:
		connections.append(other)
		other.connections.append(self)

func is_connected_to(other: Pin) -> bool:
	return other in connections

func _process(_delta: float) -> void:
	clicked_state = false
