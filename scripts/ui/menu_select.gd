extends Control

@onready var prev_title: Label = $PreviousItem/MenuSelect/Title
@onready var prev_description: Label = $PreviousItem/MenuSelect/Description
@onready var sel_title: Label = $SelectedItem/MenuSelect/Title
@onready var sel_description: Label = $SelectedItem/MenuSelect/Description
@onready var next_title: Label = $NextItem/Title
@onready var next_description: Label = $NextItem/Description

@export var items: Array[MenuItem] = []
var currently_selected = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tick()
	
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_accept"):
		submit()
		return
	
	if Input.is_action_just_pressed("ui_left"):
		if currently_selected <= 0:
			currently_selected = items.size() - 1
		else:
			currently_selected -= 1
		tick()
	if Input.is_action_just_pressed("ui_right"):
		if currently_selected >= items.size() - 1:
			currently_selected = 0
		else:
			currently_selected += 1
		tick()

func tick() -> void:
	var prev_obj: MenuItem
	var sel_obj: MenuItem = items[currently_selected]
	var next_obj: MenuItem
	if currently_selected <= 0:
		prev_obj = items[items.size() - 1]
	else:
		prev_obj = items[currently_selected - 1]
		
	if currently_selected >= items.size() - 1:
		next_obj = items[0]
	else:
		next_obj = items[currently_selected + 1]
	
	prev_title.text = prev_obj.name
	prev_description.text = prev_obj.description
	sel_title.text = sel_obj.name
	sel_description.text = sel_obj.description
	next_title.text = next_obj.name
	next_description.text = next_obj.description

func submit() -> void:
	if items[currently_selected].id == "q":
		get_tree().quit()
	pass
