extends MeshInstance2D

@onready var area_2d: Area2D = $Area2D

@export var which_key : String


func _process(_delta: float) -> void:
	
	pass
	

func _unhandled_input(event: InputEvent) -> void:
	# Shows if music note collides with this and triggers remove on the note
	var note = area_2d.get_overlapping_areas()
	if event.is_pressed():
		if note.size() >= 1:
			if note[0].get_parent().long_note == true:
				var i = 0
				
				while i < note.size():
					note[i].get_parent().remove()
					i += 1
			elif note[0].get_parent().long_note == false and not event.is_echo():
				note[0].get_parent().remove()
	
	
	
	
	
