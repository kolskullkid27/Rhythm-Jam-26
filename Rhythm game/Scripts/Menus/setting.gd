extends Control

@export var mute:CheckBox
@export var volume:HSlider
@export var window_size:OptionButton
@onready var hover_sound: AudioStreamPlayer = $HoverSound


func _ready() -> void:
	visible = false

func _process(_delta: float) -> void:
	
	# Keeps the options the same with diffrent Scenes
	mute.button_pressed = Autoloader.mute
	volume.value = Autoloader.master_volume
	window_size.selected = Autoloader.window_size
	
	# Shows settings
	visible = Autoloader.show_settings

# Volume slider
func _on_volume_value_changed(value: float) -> void:
	# Changes Master_volume 
	Autoloader.master_volume = value
	if value == -50:
		Autoloader.mute = true
	else:
		Autoloader.mute = false

# Mute Button
func _on_check_box_toggled(toggled_on: bool) -> void:
	Autoloader.mute = toggled_on

# Window options
func _on_option_button_item_selected(index: int) -> void:
	# Changes window type
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			Autoloader.window_size = 0
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			Autoloader.window_size = 1

# Back Button
func _on_button_pressed() -> void:
	Autoloader.show_settings = false

# Plays hover sound
func _on_mouse_entered() -> void:
	hover_sound.play()
