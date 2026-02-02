extends CharacterBody2D

@export var speed: float = 120.0

var player: Node2D

func _ready():
	# Force processing (removes editor / process-mode weirdness)
	set_physics_process(true)

	# Find the player safely
	player = get_tree().get_first_node_in_group("player")

	# Debug: confirm each zombie is alive and processing
	print("Zombie ready:", self, " Player found:", player != null)

func _physics_process(delta):
	# Debug: confirm physics is running for ALL zombies
	# (You can remove this once confirmed)
	# print("Zombie physics:", self)

	if player == null:
		return

	var direction := player.global_position - global_position
	if direction.length_squared() == 0:
		return

	velocity = direction.normalized() * speed
	move_and_slide()
