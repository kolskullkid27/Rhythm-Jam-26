extends MeshInstance2D

@onready var area_2d: Area2D = $Area2D

@export var which_key : String


func _process(_delta: float) -> void:
	# Shows if music note collides with this and triggers remove on the note
	var note = area_2d.get_overlapping_areas()
	
	if Input.is_action_just_pressed(which_key):
		if note.size() >= 1:
			print(note[0])
			note[0].get_parent().remove()
