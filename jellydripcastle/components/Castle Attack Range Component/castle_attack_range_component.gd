class_name CastleAttackRangeComponent
extends Node

## Signal enemy has entered attackable range
signal flag_attackable
## Signal enemy has left attackable range
signal unflag_attackable

func _on_attackable_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy") && !flag_attackable.is_connected(body.get_node("Enemy State Manager").in_range):
		flag_attackable.connect(body.get_node("Enemy State Manager").in_range)
		emit_signal("flag_attackable")
	else:
		emit_signal("flag_attackable")

func _on_attackable_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemy") && !unflag_attackable.is_connected(body.get_node("Enemy State Manager").out_of_range):
		unflag_attackable.connect(body.get_node("Enemy State Manager").out_of_range)
		emit_signal("unflag_attackable")
	else:
		emit_signal("unflag_attackable")
