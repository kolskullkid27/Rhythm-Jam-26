extends Node3D

@export var hover_sound: AudioStreamPlayer
@export var menu: CanvasLayer


func _process(_delta: float) -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	# Hides or shows menu for settings
	menu.visible = !Autoloader.show_settings

# Plays hover sound
func _on_button_mouse_entered() -> void:
	hover_sound.play()

# Play button
func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")

# Settings button
func _on_setting_button_pressed() -> void:
	Autoloader.show_settings = true

# Quit button
func _on_quit_button_pressed() -> void:
	get_tree().quit()
