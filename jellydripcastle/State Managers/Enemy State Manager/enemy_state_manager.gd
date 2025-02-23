class_name EnemyStateManager
extends Node

## Signal to attack component to begin attacking
signal begin_attacking

## Signal to stop attacking when out of range
signal stop_attacking

enum states {ATTACKING, MOVING}
## Current enemy state
@export var current_state : states = states.MOVING

## Enemy attack component to damage castl
@export var attack_component : EnemyAttackComponent

func _ready() -> void:
	begin_attacking.connect(attack_component.start_attack)
	stop_attacking.connect(attack_component.stop_attack)

func change_state(new_state : states):
	current_state = new_state

## In range of castle
func in_range():
	change_state(states.ATTACKING)
	emit_signal("begin_attacking")

## Out of range of castle
func out_of_range():
	change_state(states.MOVING)
	emit_signal("stop_attacking")
