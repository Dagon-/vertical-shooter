extends Area2D

var max_speed = 100
var spawn_area #= Vector2(0, 0)
var screen_size #= Vector2(0, 0)


func _ready():
	randomize()
	screen_size = get_viewport_rect().size
	spawn_area = Vector2(10, screen_size.x - 10)
	$AnimatedSprite.playing = true
	select_path(spawn_area)
	
func _process(delta):
	position.y += max_speed * delta

func select_path(spawn_area):
	position.x = randi()%int(spawn_area.y)+int(spawn_area.x)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
