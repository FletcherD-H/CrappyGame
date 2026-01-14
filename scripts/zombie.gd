extends CharacterBody2D

@export var speed := 50.0
@export var player: Node2D

func _physics_process(delta):
	if player == null:
		return

	var dir = (player.global_position - global_position).normalized()
	velocity = dir * speed
	move_and_slide()
