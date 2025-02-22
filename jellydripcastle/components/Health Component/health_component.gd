class_name HealthComponent

extends Node

## Max health of entity
@export var max_health : float = 10.0

## Current health of entity
@export var current_health : float

## Entity
@export var body : CharacterBody2D

func _ready() -> void:
	current_health = max_health
	print("current health : " + str(current_health))
	
func take_damage(damage : float):
	current_health -= damage
	if current_health <= 0:
		die()
	
func heal(heal_amount : float):
	current_health += heal_amount
	if current_health > max_health:
		current_health = max_health
	
func die():
	body.call_deferred("queue_free")
