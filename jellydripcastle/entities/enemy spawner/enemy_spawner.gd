class_name EnemySpawner
extends Node

## Time between spawns
@export var spawn_rate : float = 2.0

## Number of enemies spawned at once
@export var spawn_count : int = 1

## Scene load for enemy
@export var enemy_path : String

func calculate_spawn_rate():
	spawn_rate = randf_range(3.0, 4.0)
	
func calculate_spawn_count():
	spawn_count = randi_range(0,2)

func _on_spawn_timer_timeout() -> void:
	for x in range(spawn_count):
		var enemy = load(enemy_path)
		var enemy_instance = enemy.instantiate()
		enemy_instance.position = self.position
		get_parent().add_child(enemy_instance)

func _on_spawn_setting_timer_timeout() -> void:
	calculate_spawn_count()
	calculate_spawn_rate()
	print(spawn_rate)
	print(spawn_count)
