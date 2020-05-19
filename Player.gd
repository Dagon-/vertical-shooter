extends Area2D

export var speed = 400  # How fast the player will move (pixels/sec).
export (PackedScene) var Projectile

var screen_size  # Size of the game window.
signal PlayerDestroyed


func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	# The player's movement vector.
	# This also resets the velocity to (0, 0)
	#screen_size = get_viewport_rect()
	var velocity = Vector2()  

	# Right
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimatedSprite.play("right")
	elif Input.is_action_just_released("ui_right"):
		$AnimatedSprite.play("right", true) # play in reverse
	# Left
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimatedSprite.play("left")
	elif Input.is_action_just_released("ui_left"):
		$AnimatedSprite.play("left", true) # play in reverse
	# Down
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	# Up
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	# Primary fire
	if Input.is_action_just_pressed("fire_primary"):
		fire_primary_weapon()

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func _on_Player_area_entered(area):		
	$CollisionShape2D.set_deferred("disabled", true)

	# Stop processing in _process.
	# This is mainly to prevent keyboard input 
	set_process(false)

	$AnimatedSprite.animation = "explode"
	$AnimatedSprite.play()
	
	emit_signal("PlayerDestroyed")


func fire_primary_weapon():
	var i = Projectile.instance()
	# Add the projectile as an instance of Players
	# owner (Main) so it owns the movement
	owner.add_child(i)
	i.transform = $Hardpoint1.global_transform

