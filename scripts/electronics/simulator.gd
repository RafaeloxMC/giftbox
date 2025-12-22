extends Node

func evaluate(components: Array):
	var battery: Battery = null
	var resistors: Array[Resistor] = []

	for c in components:
		if c is Battery:
			battery = c
		elif c is Resistor:
			resistors.append(c)

	if battery == null:
		return

	for c in components:
		if c is LED:
			var led: LED = c
			var powered := _is_led_powered(led, battery, resistors)
			led.set_on(powered)

func _is_led_powered(led: LED, battery: Battery, resistors: Array) -> bool:
	print("Checking LED:", led.name)
	print(" Anode reachable:", _reachable(battery.get_positive_pin(), led.anode))
	print(" Cathode reachable:", _reachable(led.cathode, battery.get_negative_pin()))
	
	if not _reachable(battery.get_positive_pin(), led.anode):
		return false
		
	if not _reachable(led.cathode, battery.get_negative_pin()):
		return false
		
	if resistors.is_empty():
		return false
		
	return true

func _reachable(start: Pin, target: Pin) -> bool:
	var visited: Array[Pin] = []
	return _dfs_simple(start, target, visited)

func _dfs_simple(current: Pin, target: Pin, visited: Array) -> bool:
	if current in visited:
		return false

	if current == target:
		return true

	visited.append(current)

	for next in current.connections:
		if _dfs_simple(next, target, visited):
			return true

	return false

func clear(components: Array):
	for c in components:
		if c is LED:
			c.set_on(false)

		if c.has_method("get_pins"):
			for pin in c.get_pins():
				pin.disconnect_all()
	
	for c in components:
		if c is Resistor:
			c.pin_a.connect_to(c.pin_b)
