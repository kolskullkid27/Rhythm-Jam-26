extends Node

# Settings var
var master_volume = 0
var mute = false
var window_size = 0
var show_settings = false

var score = 0

func _process(_delta: float) -> void:
	
	# Controls the volume
	AudioServer.set_bus_volume_db(0,master_volume)
	AudioServer.set_bus_mute(0,mute)

# Trigers if the game is reset
func _restart() -> void:
	master_volume = 0
	mute = false
