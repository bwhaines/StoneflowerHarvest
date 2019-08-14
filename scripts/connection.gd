extends Line2D

# This class defines the behavior of a connection between two patches

class_name Connection

onready var GameRoot = get_node("/root/game_world")

var nodes = []

func _ready():
	default_color = Color(0, 0, 0)

func _init_(src_cluster, dest_cluster):
	
	# Save clusters for future refence
	nodes.append(src_cluster)
	nodes.append(dest_cluster)
	
	# Setup endpoints
	add_point(src_cluster.rect_position + src_cluster.rect_size * src_cluster.rect_scale / 2.0)
	add_point(dest_cluster.rect_position + dest_cluster.rect_size * dest_cluster.rect_scale / 2.0)

# Destroy this connection and update clusters accordingly
func destroy():
	nodes[0].add_connection()
	nodes[1].add_connection()
	nodes[0].connected_nodes.erase(nodes[1].node_id)
	nodes[1].connected_nodes.erase(nodes[0].node_id)
	self.queue_free()
