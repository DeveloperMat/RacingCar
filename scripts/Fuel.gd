extends StaticBody2D
signal pickedFuel

export (int) var speed = 340

func _process(delta):
	move_local_y(speed * delta)
	#if global_position.y >= 720:
	#	self.queue_free()
		

func _on_Fuel_Area_body_entered(body):
	if body.get_name() == "Player":
		emit_signal("pickedFuel")
