extends Node2D

# How fast the level is scrolling
var speed = 80
var bg_lenght = 768

var backgrounds = []

func _ready():
	var child_list

	child_list = get_children()
	for node in child_list:
		if node is TileMap:
			backgrounds.append(node)

func _process(delta):

	for node in backgrounds:
		# scroll the node
		node.position.y += speed * delta
		# If the node is behind the player move it to the top
		if node.position.y > bg_lenght:
			node.position.y -= bg_lenght * 3

