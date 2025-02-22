extends CharacterBody2D

## Check if jelly storage can hold collided jelly
signal check_storage

## Collect 1 jelly from ground
signal jelly_collected

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var BULLET : String

## Jelly Storage Component
@export var jelly_component : JellyStorageComponent

func _ready() -> void:
	check_storage.connect(jelly_component.is_space_available)
	jelly_collected.connect(jelly_component.jelly_collected)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func shoot():
	var bullet = load(BULLET).instantiate()
	get_parent().add_child(bullet)
	bullet.transform = Transform2D(self.get_local_mouse_position().angle(), self.position)

## Update jelly storage and destroy collided jelly
func pickup_jelly():
	emit_signal("jelly_collected")

## Signaled from jelly collided with
func collide_jelly():
	emit_signal("check_storage")
