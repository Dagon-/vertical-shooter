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
	select_spawn(spawn_area)
	
func _process(delta):
	position.y += max_speed * delta

# Pick a random point at the top of the screen
func select_spawn(spawn_area):
	position.x = rng.randi_range(spawn_area.x, spawn_area.y)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Mob_area_entered(area):
	# Disable collisions
	$CollisionShape2D.set_deferred("disabled", true)

	# Stop processing in _process. 
	set_process(false)

	$AnimatedSprite.animation = "explode"
	$AnimatedSprite.play()
	$DespawnTimer.start()

func _on_DespawnTimer_timeout():
	queue_free()
