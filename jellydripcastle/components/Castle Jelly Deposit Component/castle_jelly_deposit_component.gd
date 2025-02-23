# This one is kinda a mouthful

class_name CastleJellyDepositComponent
extends Area2D

## Signal to the Jelly Storage that an attempt to store the jelly has been made
signal attempt_jelly_store

## Get the jelly component from the player
@onready var jelly_storage : JellyStorageComponent = get_tree().get_first_node_in_group("player").get_node("JellyStorageComponent")

func _ready() -> void:
	attempt_jelly_store.connect(jelly_storage.jelly_deposited)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("attempt_jelly_store") 
