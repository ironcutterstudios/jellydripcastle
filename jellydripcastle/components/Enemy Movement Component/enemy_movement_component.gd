class_name EnemyMovementComponent
extends Node

## Speed of enemy
@export var SPEED : int = 150

## Body of the enemy
@export var body : CharacterBody2D

## State Manager
@export var state_manager : EnemyStateManager

var castle : Area2D

func _ready() -> void:
	castle = get_tree().get_first_node_in_group("castle")

func _physics_process(_delta: float) -> void:
	if state_manager.current_state == state_manager.states.MOVING:
		var direction = body.global_position.direction_to(castle.global_position)
		body.velocity.x = SPEED * direction.x
		body.move_and_slide()
		
