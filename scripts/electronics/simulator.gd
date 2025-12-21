extends Node

func evaluate(components: Array):
	var battery: Battery = components.filter(func(c): return c is Battery).front()
	if battery == null:
		return

	for c in components:
		if c is LED:
			var led: LED = c
			var valid := _check_led(led, battery)
			led.set_on(valid)

func _check_led(led: LED, battery: Battery) -> bool:
	var visited := []
	return _dfs(
		battery.get_positive_pin(),
		led.anode,
		battery.get_negative_pin(),
		visited,
		false
	)

func _dfs(start: Pin, target: Pin, end: Pin, visited: Array, has_resistor: bool) -> bool:
	if start in visited:
		return false

	visited.append(start)

	if start == target:
		return _dfs(target, end, end, visited, has_resistor)

	if start == end:
		return has_resistor

	for next in start.connections:
		var new_has_resistor = has_resistor or _pin_belongs_to_resistor(next)
		if _dfs(next, target, end, visited, new_has_resistor):
			return true

	return false

func _pin_belongs_to_resistor(pin: Pin) -> bool:
	return pin.get_parent().get_parent() is Resistor
