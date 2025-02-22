class_name PlayerUI
extends Control

@export var health_bar : ProgressBar

func _ready() -> void:
	health_bar.value = health_bar.max_value
	
func update_health_bar(new_health : float):
	health_bar.value = new_health

func set_health_bar_max(new_health : float):
	health_bar.max_value = new_health
