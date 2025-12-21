class_name LED
extends Component

@onready var anode := pins[0]
@onready var cathode := pins[1]

func set_on(on: bool):
	var tween = create_tween()
	tween.tween_property($Glow, "modulate:a", 1.0 if on else 0.0, 0.3)
	print("LED SET TO: " + str(on))
