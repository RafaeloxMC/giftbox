extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var score = 0
var high_score = 0

func play_ambience():
	if not audio_stream_player.playing:
		audio_stream_player.play()
	
func stop_ambience():
	audio_stream_player.stop()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		SceneManager.load_scene("main_menu")
