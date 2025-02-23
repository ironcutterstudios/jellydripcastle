class_name Cash
extends Area2D

## Value of cash
@export var cash_value : int = 1

## Upper bound of cash value
@export var cash_upper : int = 10

## Lower bound of cash value
@export var cash_lower : int = 1

## Signal to player that they collided with jelly
signal player_collision

func _ready() -> void:
	cash_value = calculate_value()
	player_collision.connect(get_tree().get_first_node_in_group("player").collide_cash)

func _on_body_entered(body: Node2D) -> void:
	emit_signal("player_collision", self)

func picked_up():
	call_deferred("queue_free")
	
func calculate_value():
	return randi_range(cash_lower, cash_upper)
	
	
