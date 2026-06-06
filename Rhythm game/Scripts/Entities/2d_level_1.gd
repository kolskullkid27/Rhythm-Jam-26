extends Node2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var fade_node: Node2D = $AnimationPlayer/FadeNode
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var good_score: Label = $CanvasLayer/GoodScore
@onready var _3d_version_animated_sprite_2d_2: AnimatedSprite2D = $"3DVersionAnimatedSprite2D2"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D




var ended = false


# Songs Text File
@export var song = "res://Scripts/SongData/ToBeSomething.txt"
var song_file = FileAccess.open(song, FileAccess.READ)
var song_text
var end_time = 0

func _ready() -> void:
	# Gets the first line in the text file
	song_text = song_file.get_line()

func _process(_delta: float) -> void:
	if Autoloader.score >= 750:
		animated_sprite_2d.visible = false
		_3d_version_animated_sprite_2d_2.visible = true
	
	
	if audio_stream_player.get_playback_position() >= 82:
		Autoloader.level1_score = Autoloader.score
		ended = true
		get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
	
	good_score.text = "Score: " + str(Autoloader.score)
	
	# Spawns notes
	if audio_stream_player.get_playback_position() >= float(song_text.substr(3, 10)) - .75 and ended == false:
		spawn_note()
		song_text = song_file.get_line()
	
	# End of song
	if song_text == "End":
		ended = true
	
	

func spawn_note():
	# Spawns the type of note
	var music_note = preload("uid://dbniy20ksystw")
	var music_note_instantiate = music_note.instantiate()
	if song_text[0] == "w":
		music_note_instantiate.global_position = Vector2(1200, 226)
	elif song_text[0] == "l":
		music_note_instantiate.global_position = Vector2(1200, 226)
		song_text = song_file.get_line()
		end_time = float(song_text.substr(3, 10))
	# The other keys, Diabled for now
	#elif song_text[0] == "a":
		#music_note_instantiate.global_position = Vector2(1200, 225)
	#elif song_text[0] == "s":
		#music_note_instantiate.global_position = Vector2(1200, 330)
	#elif song_text[0] == "d":
		#music_note_instantiate.global_position = Vector2(1200, 440)
	
	add_child(music_note_instantiate)
	


func _on_timer_timeout() -> void:
	pass
	#if end_time > audio_stream_player.get_playback_position():
		#var music_note_instantiate = music_note.instantiate()
		#music_note_instantiate.global_position = Vector2(1200, 226)
		#music_note_instantiate.long_note = true
		#canvas_layer.add_child(music_note_instantiate)
