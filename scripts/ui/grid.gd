extends Control

@export var space_between_x: int = 10
@export var space_between_y: int = 10
@export var grid_color: Color = Color(1.0, 1.0, 1.0, 1.0)

func _ready() -> void:
	var width = self.size.x
	var height = self.size.y
	
	var i = width / space_between_x
	
	for j in range(i):
		var colorrect = ColorRect.new()
		colorrect.position.x = j * space_between_x + space_between_x / 2.0
		colorrect.position.y = 0
		colorrect.size.x = 1
		colorrect.size.y = height
		colorrect.color = grid_color
		self.add_child(colorrect)
		
	for j in range(i):
		var colorrect = ColorRect.new()
		colorrect.position.y = j * space_between_y + space_between_y / 2.0
		colorrect.position.x = 0
		colorrect.size.y = 1
		colorrect.size.x = width
		colorrect.color = grid_color
		self.add_child(colorrect)
