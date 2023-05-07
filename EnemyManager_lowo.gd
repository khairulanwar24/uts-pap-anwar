extends Node

const SPAWN_RADIUS = 400

@export var enemey_lowo_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(on_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = player.global_position + (random_direction * SPAWN_RADIUS)
	
	var enemy2 = enemey_lowo_scene.instantiate() as Node2D
	get_parent().add_child(enemy2)
	enemy2.global_position = spawn_position
