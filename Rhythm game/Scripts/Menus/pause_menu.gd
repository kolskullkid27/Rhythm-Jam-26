extends CanvasLayer

@export var hover_sound:AudioStreamPlayer
@export var v_box_container: VBoxContainer

func _ready() -> void:
	visible = false

func _process(_delta: float) -> void:
	
	# paused pressed
	if Input.is_action_just_pressed("paused") and Autoloader.show_settings == false:
		get_tree().paused = !get_tree().paused
	
	# Triggers the pause menu
	if get_tree().paused == true:
		v_box_container.visible = !Autoloader.show_settings
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		visible = true
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		visible = false

# Play hover sound
func _on_resume_button_mouse_entered() -> void:
	hover_sound.play()

# Resume button
func _on_resume_button_pressed() -> void:
	get_tree().paused = false

# Settings button
func _on_setting_button_pressed() -> void:
	Autoloader.show_settings = true

# Main menu button
func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")

# Quit button
func _on_quit_button_pressed() -> void:
	get_tree().quit()
