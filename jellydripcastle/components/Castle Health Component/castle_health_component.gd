class_name CastleHealthComponent

extends Node

## Max health of entity
@export var max_health : float = 10.0

## Current health of entity
@export var current_health : float

## Castle Body
@export var castle : Area2D

## Castle tick damage
@export var tick_damage : float

func _ready() -> void:
	current_health = max_health
	
func take_damage(damage : float):
	current_health -= damage
	if current_health <= 0:
		die()
	
func heal(heal_amount : float):
	current_health += heal_amount
	if current_health > max_health:
		current_health = max_health
	
func die():
	castle.call_deferred("queue_free")

func _on_damage_tick_timer_timeout() -> void:
	take_damage(tick_damage)
