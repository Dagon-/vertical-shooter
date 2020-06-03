extends Area2D

var speed = 1000
var damage = 1

func _process(delta):
	position -= transform.y * speed * delta

func _on_Projectile_area_entered(area):
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
