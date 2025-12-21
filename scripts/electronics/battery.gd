extends Component
class_name Battery

@export var voltage: float = 5.0

@onready var positive_pin: Pin = $Pins/PositivePin
@onready var negative_pin: Pin = $Pins/NegativePin

func get_positive_pin() -> Pin:
	return positive_pin

func get_negative_pin() -> Pin:
	return negative_pin
