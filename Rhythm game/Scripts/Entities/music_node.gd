extends MeshInstance2D

@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

@export var long_note = false

const SPEED = 1000

var ot = false

func _process(delta: float) -> void:
	# Note Movement
	position.x -= SPEED * delta
	
	# Deletes when note goes off screen
	if global_position.x <= -400:
		queue_free()


func remove():
	# Removes the note, with particle effects
	if ot == false:
		self_modulate.a = 0
		cpu_particles_2d.emitting = true
		ot = true


func _on_cpu_particles_2d_finished() -> void:
	# Delete note
	queue_free()
