extends Area2D
export (int) var speed = 400
signal pickedOil

func _process(delta):
	move_local_y(speed * delta)




func _on_Oil_body_entered(body):
	if body.get_name() == "Player":
		emit_signal("pickedOil")
