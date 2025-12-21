extends Component
class_name Resistor

@onready var pin_a: Pin = $Pins/A
@onready var pin_b: Pin = $Pins/B

func _ready() -> void:
	pin_a.connect_to(pin_b)
