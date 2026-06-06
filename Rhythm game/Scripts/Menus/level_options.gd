extends Node2D

@onready var title_label: Label = $MeshInstance2D/TitleLabel
@onready var bpm_label: Label = $MeshInstance2D/BPMLabel
@onready var credit_label: Label = $MeshInstance2D/CreditLabel
@onready var score_label: Label = $MeshInstance2D/ScoreLabel

@export var level: PackedScene

@export var title = "Title"
@export var Bpm = "90"
@export var credit = "Someone"

func _ready() -> void:
	if level != null:
		score_label.text = str(Autoloader.level1_score)
	title_label.text = title
	bpm_label.text = "BPM: " + Bpm
	credit_label.text = "Made by " + credit
