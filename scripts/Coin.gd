extends Area2D
signal coinRecolected

export (int) var speed = 400

func _process(delta):
	move_local_y(speed * delta)


func _on_Coin_body_entered(body):
	if body.get_name() == "Player":
		emit_signal("coinRecolected")
