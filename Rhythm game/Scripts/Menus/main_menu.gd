extends Node3D

@export var hover_sound: AudioStreamPlayer
@export var menu: CanvasLayer
@onready var level_selector: CanvasLayer = $LevelSelector



func _ready() -> void:
	level_selector.visible = false

func _process(_delta: float) -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	# Hides or shows menu for settings
	menu.visible = !Autoloader.show_settings and !level_selector.visible

# Plays hover sound
func _on_button_mouse_entered() -> void:
	hover_sound.play()

# Play button
func _on_play_button_pressed() -> void:
	level_selector.visible = true


# Settings button
func _on_setting_button_pressed() -> void:
	Autoloader.show_settings = true

# Quit button
func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_back_button_pressed() -> void:
	level_selector.visible = false
