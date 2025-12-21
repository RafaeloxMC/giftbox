extends Component
class_name Battery

@export var voltage := 5.0

@onready var anode: Pin = $Pins/Anode
@onready var cathode: Pin = $Pins/Cathode

func get_positive_pin() -> Pin:
	return anode

func get_negative_pin() -> Pin:
	return cathode
