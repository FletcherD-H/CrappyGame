extends CharacterBody2D

@export var speed := 500.0

func _physics_process(delta):
	var input := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)

	if input.length() > 0:
		input = input.normalized()

	velocity = input * speed
	move_and_slide()
