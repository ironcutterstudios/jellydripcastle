extends Control

const MAIN = preload("res://scenes/Game/main_game.tscn")
const SHOP = preload("res://scenes/Shop/shop.tscn")

func _on_start_button_button_down() -> void:
	var main = MAIN.instantiate()
	owner.add_child(main)
	unload_menu()
	
func _on_shop_button_button_down() -> void:
	var shop = SHOP.instantiate()
	owner.add_child(shop)
	unload_menu()

func _on_exit_button_button_down() -> void:
	get_tree().quit(0)

func unload_menu():
	get_node(".").queue_free()
