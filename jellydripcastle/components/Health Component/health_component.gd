class_name HealthComponent

extends Node

## Max health of entity
@export var max_health : float = 10.0

## Current health of entity
@export var current_health : float

## Entity
@export var body : CharacterBody2D

## Health bar
@export var health_bar : ProgressBar

func _ready() -> void:
	current_health = max_health
	health_bar.value = current_health
	health_bar.max_value = max_health
	
func take_damage(damage : float):
	current_health -= damage
	if current_health <= 0:
		die()
	health_bar.value = current_health
	
func heal(heal_amount : float):
	current_health += heal_amount
	if current_health > max_health:
		current_health = max_health
	
func die():
	body.call_deferred("queue_free")
