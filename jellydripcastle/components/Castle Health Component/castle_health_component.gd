class_name CastleHealthComponent

extends Node

signal update_ui_castle_health
signal update_ui_castle_max_health
signal game_over

## Node managing the game
@onready var game_manager = get_tree().get_first_node_in_group("game_manager")

## Max health of entity
@export var max_health : float = 10.0

## Current health of entity
@export var current_health : float

## Castle Body
@export var castle : Area2D

## Castle tick damage
@export var tick_damage : float

var player_ui : Control

func _ready() -> void:
	game_over.connect(game_manager.on_game_over)
	player_ui = get_tree().get_first_node_in_group("ui")
	current_health = max_health
	update_ui_castle_health.connect(player_ui.update_health_bar)
	update_ui_castle_max_health.connect(player_ui.set_health_bar_max)
	emit_signal("update_ui_castle_max_health", max_health)
	emit_signal("update_ui_castle_health", current_health)
	
func take_damage(damage : float):
	current_health -= damage
	if current_health <= 0:
		die()
	emit_signal("update_ui_castle_health", current_health)
	
func heal(heal_amount : float):
	current_health += heal_amount
	if current_health > max_health:
		current_health = max_health
	emit_signal("update_ui_castle_health", current_health)
	
func die():
	emit_signal("game_over")

func _on_damage_tick_timer_timeout() -> void:
	take_damage(tick_damage)

func get_health():
	return current_health
