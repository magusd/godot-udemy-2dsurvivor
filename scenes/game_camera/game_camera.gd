extends Camera2D

var target = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	acquire_target()
	global_position = global_position.lerp(target, 1.0 - exp(-delta * 10))


func acquire_target():
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() == 1:
		var player = player_nodes[0] as Node2D
		target = player.global_position
		#global_position = player.global_position
