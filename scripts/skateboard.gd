extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var push_accel: float = 200.0
@export var brake_decel: float = 200.0
@export var ground_friction: float = 600.0
@export var air_friction: float = 200.0
@export var max_speed: float = 200.0
@export var max_reverse_speed: float = 200.0
@export var jump_velocity: float = -350.0

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_in_air: bool = false 

func _ready() -> void:
	animated_sprite_2d.animation_finished.connect(anim_finished)

func _physics_process(delta: float) -> void:
	var on_floor: bool = is_on_floor()
	
	if not on_floor:
		velocity.y += gravity * delta
	
	var target_vel_x: float = 0.0
	var current_speed: float = velocity.x
	
	if Input.is_action_pressed("ui_right"):
		target_vel_x = max_speed
		velocity.x = move_toward(current_speed, target_vel_x, push_accel * delta)
		animated_sprite_2d.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		target_vel_x = -max_reverse_speed
		velocity.x = move_toward(current_speed, target_vel_x, brake_decel * delta)
		animated_sprite_2d.flip_h = true
	else:
		var friction: float = ground_friction if on_floor else air_friction
		velocity.x = move_toward(current_speed, 0.0, friction * delta)
	
	if Input.is_action_just_pressed("ui_accept") and on_floor:
		velocity.y = jump_velocity
		animated_sprite_2d.play("jump")
	
	if on_floor and is_in_air:
		animated_sprite_2d.play_backwards("jump")
	
	velocity.x = clamp(velocity.x, -max_reverse_speed, max_speed)
	
	is_in_air = !on_floor
	
	move_and_slide()

func anim_finished() -> void:
	if animated_sprite_2d.animation == "jump" && self.is_on_floor():
		animated_sprite_2d.play("idle")
