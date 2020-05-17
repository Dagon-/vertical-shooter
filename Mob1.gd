extends Area2D

var max_speed = 150
var screen_size
var rng = RandomNumberGenerator.new()


func _ready():
	rng.randomize()
	screen_size = get_viewport_rect().size
	# Make sure the mobs spawn fully inside the viewport
	var spawn_area = Vector2(40, screen_size.x - 40)
	$AnimatedSprite.playing = true
	select_path(spawn_area)
	
func _process(delta):
	position.y += max_speed * delta

func select_path(spawn_area):
	position.x = rng.randi_range(spawn_area.x, spawn_area.y)
#
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
