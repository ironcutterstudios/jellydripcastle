class_name JellyStorageComponent
extends Control

## Max amount of jelly that can be stored
@export var max_jelly : int

## Current amount of jelly that can be stored
@export var current_jelly : int

## Player connected to jelly storage
@export var player : CharacterBody2D

## Castle health component
@onready var castle_health : CastleHealthComponent = get_tree().get_first_node_in_group("castle").get_node("CastleHealthComponent")

## Jelly Storage Bar
@export var jelly_storage : ProgressBar

## Health value for castle when deposited
@export var jelly_value : float = 10.0

## A signal sent to the player if there is room to pick up a jelly
signal space_available

## Signal to the castle that jelly has been inserted for health
signal deposit_jelly

func _ready() -> void:
	jelly_storage.value = current_jelly
	jelly_storage.max_value = max_jelly
	space_available.connect(player.pickup_jelly)
	deposit_jelly.connect(castle_health.heal)

func is_space_available(jelly : Jelly):
	if current_jelly < max_jelly:
		emit_signal("space_available", jelly)

func jelly_collected():
	current_jelly += 1
	print("current jelly count: " + str(current_jelly))

func jelly_deposited():
	while current_jelly > 0 && castle_health.get_health() < castle_health.max_health:
		emit_signal("deposit_jelly", jelly_value)
		current_jelly -= 1
		
