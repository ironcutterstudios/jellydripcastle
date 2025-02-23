class_name Jelly
extends Area2D

## Signal to player that they collided with jelly
signal player_collision

func _ready() -> void:
	player_collision.connect(get_tree().get_first_node_in_group("player").collide_jelly)

func _on_body_entered(body: Node2D) -> void:
	emit_signal("player_collision", self)

func picked_up():
	call_deferred("queue_free")
