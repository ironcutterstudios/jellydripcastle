class_name EnemyAttackComponent
extends Node

## Signal to tell castle to take damage
signal damage_castle
signal one_time_hit_complete

## State manager to determine if dealing damage or not
@export var state_manager : EnemyStateManager

## Enemy body to connect one_time_hit_complete signal
@export var health_component : HealthComponent

## Timer for attack cooldown
@export var attack_timer : Timer

## Cooldown on attacks
@export var cooldown_rate : float = 2.0

## Cooldown boolean
var on_cooldown : bool = false

## Damage dealt by an enemy attack
@export var DAMAGE : float = 10.0

## One time hit enemies will attack then die
@export var one_time_hit : bool = true

var castle_health_component : CastleHealthComponent

func _ready() -> void:
	if one_time_hit:
		one_time_hit_complete.connect(health_component.die_without_drop)
	castle_health_component = get_tree().get_first_node_in_group("castle").get_node("CastleHealthComponent")
	damage_castle.connect(castle_health_component.take_damage)
	if state_manager.current_state == state_manager.states.ATTACKING && !on_cooldown:
		attack()
		
func attack():
	emit_signal("damage_castle", DAMAGE)
	if one_time_hit:
		emit_signal("one_time_hit_complete")
	
func start_attack():
	attack()
	attack_timer.start(cooldown_rate)
	
func stop_attack():
	attack_timer.stop()

func _on_cooldown_rate_timeout() -> void:
	attack()
