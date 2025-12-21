extends Node2D
class_name Board

var selected_pin: Pin = null

func _ready():
	print(str(get_all_pins()))
	for pin in get_all_pins():
		pin.clicked.connect(_on_pin_clicked)

func get_all_pins() -> Array[Pin]:
	var pins: Array[Pin] = []
	for component in $Components.get_children():
		if component.has_method("get_pins"):
			pins.append_array(component.get_pins())
	return pins

func _draw():
	for pin in get_all_pins():
		for other in pin.connections:
			if pin.get_instance_id() < other.get_instance_id():
				draw_line(
					to_local(pin.global_position),
					to_local(other.global_position),
					Color(0.9, 1.0, 0.0),
					3.0,
					true
				)
				
func _on_pin_clicked(pin: Pin):
	if selected_pin == null:
		selected_pin = pin
		pin.modulate = Color.YELLOW
	else:
		selected_pin.connect_to(pin)
		selected_pin.modulate = Color.WHITE
		selected_pin = null
		queue_redraw()
