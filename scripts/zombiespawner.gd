extends Node2D

@export var zombie_scene: PackedScene
@export var spawn_radius := 400.0

var spawn_time := 2.0

func _on_timer_timeout():
	spawn_zombie()
	spawn_time = max(0.5, spawn_time - 0.05)
	$Timer.wait_time = spawn_time
	
func spawn_zombie():
	if zombie_scene == null:
		return

	var zombie = zombie_scene.instantiate()
	var angle = randf() * TAU
	var offset = Vector2(cos(angle), sin(angle)) * spawn_radius

	zombie.global_position = get_parent().get_node("Player").global_position + offset
	get_tree().current_scene.add_child(zombie)
