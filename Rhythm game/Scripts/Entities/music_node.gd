extends MeshInstance2D

@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D
@onready var lil_beat_01: Sprite2D = $LilBeat01
@onready var lil_beat_02: Sprite2D = $LilBeat02
@onready var lil_beat_03: Sprite2D = $LilBeat03

@export var long_note = false

const SPEED = 1000

var ot = false

func _ready() -> void:
	if randi_range(1, 3) == 1:
		lil_beat_01.visible = true
	elif randi_range(1, 2) == 1:
		lil_beat_02.visible = true
	else:
		lil_beat_03.visible = true

func _process(delta: float) -> void:
	# Note Movement
	position.x -= SPEED * delta
	
	# Deletes when note goes off screen
	if global_position.x <= -400:
		queue_free()


func remove():
	# Removes the note, with particle effects
	if ot == false:
		Autoloader.score += 10
		lil_beat_01.visible = false
		lil_beat_02.visible = false
		lil_beat_03.visible = false
		self_modulate.a = 0
		cpu_particles_2d.emitting = true
		ot = true


func _on_cpu_particles_2d_finished() -> void:
	# Delete note
	queue_free()
