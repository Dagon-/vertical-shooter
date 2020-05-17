extends Node2D

# How fast the level is scrolling
var speed = 80
var bg_lenght = 768
var backgrounds = []
var Mob1

func _ready():
	var child_list

	# Add tilesets to list
	child_list = get_children()
	for node in child_list:
		if node is TileMap:
			backgrounds.append(node)

	# Load sauser mob
	Mob1 = load("res://Mob1.tscn")
	
func _process(delta):

	for node in backgrounds:
		# scroll the node
		node.position.y += speed * delta
		# If the node is behind the player move it to the top
		if node.position.y > bg_lenght:
			node.position.y -= bg_lenght * 3


func _on_MobTimer_timeout():
	var saucer = Mob1.instance()
	add_child(saucer) # Replace with function body.
