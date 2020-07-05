extends KinematicBody2D
signal lowFuel

export (int) var speed = 750
func _process(delta):
	move_local_y(speed * delta)
	#if global_position.y >= 720:
	#	self.queue_free()
		



func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		emit_signal("lowFuel")
