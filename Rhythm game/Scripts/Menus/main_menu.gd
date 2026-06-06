extends Node3D

@export var hover_sound: AudioStreamPlayer
@export var menu: CanvasLayer
@onready var level_selector: CanvasLayer = $LevelSelector
@onready var menu_control: Sprite2D = $Title/MenuControl

var menu_selected = 1


func _ready() -> void:
	level_selector.visible = false

func _process(_delta: float) -> void:
	if menu_selected == 1:
		menu_control.position = Vector2(519, 269)
	elif menu_selected == 2:
		menu_control.position = Vector2(503, 321)
	elif menu_selected == 3:
		menu_control.position = Vector2(522, 376)
	
	if Input.is_action_just_pressed("space"):
		if menu_selected == 1:
			_on_play_button_pressed()
	
	if level_selector.visible == true and Input.is_action_just_pressed("paused"):
		_on_back_button_pressed()
	
	if Input.is_action_just_pressed("up"):
		hover_sound.play()
		if menu_selected != 1:
			menu_selected -= 1
		else:
			menu_selected = 3
	elif Input.is_action_just_pressed("down"):
		hover_sound.play()
		if menu_selected != 3:
			menu_selected += 1
		else:
			menu_selected = 1
	
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
