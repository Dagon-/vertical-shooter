extends Node2D

# How fast the level is scrolling
var speed = 2.5
var bg_lenght = 768
var backgrounds = []
var Mob1

func _ready():

	# Load sauser mob
	Mob1 = load("res://scenes/mobs/mob_sprinter.tscn")
	
func _process(delta):
	pass
	

func _on_MobTimer_timeout():
	var saucer = Mob1.instance()
	add_child(saucer) # Replace with function body.
