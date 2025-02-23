class_name MainGame
extends Node2D

var start : String = "res://scenes/Start Menu/start_menu.tscn"

func on_game_over():
	save_stats()
	load_main_menu()
	
func save_stats():
	print("save")
	
func load_main_menu():
	var START = load(start).instantiate()
	get_parent().add_child(START)
	unload_menu()

func unload_menu():
	get_node(".").queue_free()
