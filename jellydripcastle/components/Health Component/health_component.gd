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

## Main Game
@onready var main = get_parent().get_parent()

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
	if body.is_in_group("enemy"):
		var jelly_instance = load("res://entities/Collectables/Jelly/jelly.tscn").instantiate()
		jelly_instance.position = get_parent().position
		main.call_deferred("add_child", jelly_instance)
		if drop_cash():
			var cash_instance = load("res://entities/Collectables/Money/cash.tscn").instantiate()
			cash_instance.position = get_parent().position
			main.call_deferred("add_child", cash_instance)
	body.call_deferred("queue_free")
	
func die_without_drop():
	body.call_deferred("queue_free")
	
func drop_cash():
	var rand = randi_range(0,1)
	if rand == 1:
		return true
	else:
		return false
