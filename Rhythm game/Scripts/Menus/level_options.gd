extends Node2D

@onready var title_label: Label = $MeshInstance2D/TitleLabel
@onready var bpm_label: Label = $MeshInstance2D/BPMLabel
@onready var credit_label: Label = $MeshInstance2D/CreditLabel

@export var level: PackedScene

@export var title = "Title"
@export var Bpm = "90"
@export var credit = "Someone"

func _ready() -> void:
	title_label.text = title
	bpm_label.text = "BPM: " + Bpm
	credit_label.text = "Made by " + credit

func _process(_delta: float) -> void:
	pass
