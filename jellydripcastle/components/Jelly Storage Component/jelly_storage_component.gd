class_name JellyStorageComponent
extends Control

## Max amount of jelly that can be stored
@export var max_jelly : int

## Current amount of jelly that can be stored
@export var current_jelly : int

## Player connected to jelly storage
@export var player : CharacterBody2D

## Jelly Storage Bar
@export var jelly_storage : ProgressBar

## A signal sent to the player if there is room to pick up a jelly
signal space_available

func _ready() -> void:
	jelly_storage.value = current_jelly
	jelly_storage.max_value = max_jelly
	space_available.connect(player.pickup_jelly)

func is_space_available():
	if current_jelly < max_jelly:
		emit_signal("space_available")

func jelly_collected():
	current_jelly += 1

func jelly_deposited():
	current_jelly -= 1
