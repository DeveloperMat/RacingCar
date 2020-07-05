extends Area2D

export (int) var speed = 350

signal truckLowFuel

func _process(delta):
	move_local_y(speed * delta)

func _on_Truck_body_entered(body):
	if body.get_name() == "Player":
		emit_signal("truckLowFuel")
