class_name EnemyAttackComponent
extends Node

## Signal to tell castle to take damage
signal damage_castle

## State manager to determine if dealing damage or not
@export var state_manager : EnemyStateManager

## Timer for attack cooldown
@export var attack_timer : Timer

## Cooldown on attacks
@export var cooldown_rate : float = 2.0

## Cooldown boolean
var on_cooldown : bool = false

## Damage dealt by an enemy attack
@export var DAMAGE : float = 10.0

var castle_health_component : CastleHealthComponent

func _ready() -> void:
	castle_health_component = get_tree().get_first_node_in_group("castle").get_node("CastleHealthComponent")
	damage_castle.connect(castle_health_component.take_damage)
	if state_manager.current_state == state_manager.states.ATTACKING && !on_cooldown:
		attack()
		
func attack():
	get_parent().position.x += 300
	emit_signal("damage_castle", DAMAGE)
	
func start_attack():
	attack_timer.start(cooldown_rate)
	print("start to attack")
	
func stop_attack():
	attack_timer.stop()
	print("stop the attack")

func _on_cooldown_rate_timeout() -> void:
	attack()
