extends Node3D

@onready var audio_stream_player: AudioStreamPlayer = $"2DSection/AudioStreamPlayer"
@onready var pivot_point: Marker3D = $"3DSection/PivotPoint"


func _process(delta: float) -> void:
	# Rotates the camera
	if audio_stream_player.get_playback_position() >= 20:
		pivot_point.rotation_degrees.y += 20 * delta
