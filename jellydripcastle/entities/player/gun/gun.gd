class_name Gun
extends Node2D

## Marker to maintain pivot point
@export var gun_pivot : Marker2D
## Weapon sprite
@export var gun_sprite : Sprite2D

func _process(delta: float) -> void:
	gun_pivot.rotation = get_angle_to(get_global_mouse_position())
	if gun_pivot.rotation_degrees < -90 || gun_pivot.rotation_degrees > 90 :
		gun_sprite.flip_v = true
	else:
		gun_sprite.flip_v = false
