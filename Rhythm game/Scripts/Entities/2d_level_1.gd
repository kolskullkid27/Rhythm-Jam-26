extends Node2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var fade_node: Node2D = $AnimationPlayer/FadeNode
@onready var canvas_layer: CanvasLayer = $CanvasLayer

@export var music_note : PackedScene

var ended = false

# Songs Text File
var song = "res://Scripts/SongData/test_song.txt"
var song_file = FileAccess.open(song, FileAccess.READ)
var song_text
var end_time = 0

func _ready() -> void:
	# Gets the first line in the text file
	song_text = song_file.get_line()

func _process(_delta: float) -> void:
	# Changes the scene to 3D
	if audio_stream_player.get_playback_position() >= 20:
		modulate.a = 0
		fade_node.modulate = 0
	
	# Spawns notes
	if audio_stream_player.get_playback_position() >= float(song_text.substr(3, 10)) - .65 and ended == false:
		spawn_note()
		song_text = song_file.get_line()
	
	# End of song
	if song_text == "End":
		get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
		ended = true
	
	

func spawn_note():
	# Spawns the type of note
	var music_note_instantiate = music_note.instantiate()
	if song_text[0] == "w":
		music_note_instantiate.global_position = Vector2(1200, 115)
	elif song_text[0] == "l":
		music_note_instantiate.global_position = Vector2(1200, 115)
		song_text = song_file.get_line()
		end_time = float(song_text.substr(3, 10))
	# The other keys, Diabled for now
	#elif song_text[0] == "a":
		#music_note_instantiate.global_position = Vector2(1200, 225)
	#elif song_text[0] == "s":
		#music_note_instantiate.global_position = Vector2(1200, 330)
	#elif song_text[0] == "d":
		#music_note_instantiate.global_position = Vector2(1200, 440)
	
	canvas_layer.add_child(music_note_instantiate)
	


func _on_timer_timeout() -> void:
	if end_time > audio_stream_player.get_playback_position():
		var music_note_instantiate = music_note.instantiate()
		music_note_instantiate.global_position = Vector2(1200, 115)
		music_note_instantiate.long_note = true
		canvas_layer.add_child(music_note_instantiate)
