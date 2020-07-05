extends KinematicBody2D

export (PackedScene) var Fuel

export (int) var speed 
export (int) var max_fuel = 100
export (int) var act_fuel = 50
var velocity = Vector2.ZERO
var limite

var getFuel
func _ready():
	set_physics_process(true)
	limite = get_viewport_rect().size

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else: 
		velocity.x = 0
		
	position += velocity * delta
	position.x = clamp(position.x,0,limite.x)

	
