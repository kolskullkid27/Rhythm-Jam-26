extends CanvasLayer

@onready var levels: Node2D = $Levels
@onready var no_song_label: Label = $NoSongLabel

var level_amount = 1
var level_on = 1
var transition_time = .5
var moving = false

func _ready() -> void:
	level_amount = levels.get_child_count()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("space") and visible == true:
		if levels.get_child(level_on - 1).level != null:
			get_tree().change_scene_to_packed(levels.get_child(level_on - 1).level)
		else:
			var tween = create_tween()
			tween.tween_property(no_song_label, "self_modulate:a", 1, .5)
			tween.tween_property(no_song_label, "self_modulate:a", 1, 1)
			tween.tween_property(no_song_label, "self_modulate:a", 0, .5)
	
	# Triggers the direction of the transition
	if moving == false:
		if Input.is_action_pressed("left") and level_on != 1:
			level_on -= 1
			transition(550)
		elif Input.is_action_pressed("right") and level_on != level_amount:
			level_on += 1
			transition(-550)

func transition(pos):
	# Creates the smooth transition
	var tween = create_tween()
	tween.tween_property(levels, "position:x", levels.position.x + pos, transition_time)
	moving = true
	await get_tree().create_timer(transition_time).timeout
	moving = false
