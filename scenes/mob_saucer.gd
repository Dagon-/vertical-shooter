extends "res://scenes/mob.gd"

const TIME_PERIOD = 1.0 # In seconds
const ACCELERATION_FACTOR = 15
var time = 0
	
func movement(delta):
	time += delta
	# Move slowly for TIME_PERIOD then accelerate
	if time < TIME_PERIOD:
		position.y += max_speed * delta
	else:
		if $AnimatedSprite.animation != "ship_thruster":
			$AnimatedSprite.animation = "ship_thruster"
		max_speed += ACCELERATION_FACTOR
		position.y += max_speed * delta
