class_name Bullet
extends Area2D

signal enemy_hit

@export var DAMAGE : float = 1.0
@export var SPEED : int = 200

func _physics_process(delta: float) -> void:
	self.position += transform.x * SPEED * delta

func isEnemy(enemy):
	return enemy.is_in_group("enemy")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		enemy_hit.connect(body.get_node("HealthComponent").take_damage)
		emit_signal("enemy_hit", DAMAGE)
		destroy_projectile()

func destroy_projectile():
	call_deferred("queue_free")
