extends Node

export (PackedScene) var Fuel
var fuel_Visibility = false
var puntos = 0 
var puntospc = 0
var time = 0 
var timepc = 0
var juego = false

func _ready():
	randomize()
	$Fuel.connect('pickedFuel',self,"on_pickedFuel")
	$Police.connect("lowFuel",self,"on_lowFuel")
	$Coin.connect("coinRecolected",self,"on_coinRecolected")
	$Truck.connect("truckLowFuel",self,"on_truckLowFuel")
	$Oil.connect("pickedOil",self,"on_oilPicked")
	$GUI/ProgressBar.value = 100
	$ScoreTimer.start()

	

func _process(delta):
	$GUI/ProgressBar.value += -1 * delta
	if juego == false && $GUI/ProgressBar.value == 0 and $Muerte.visible == false:
		$Muerte.visible = true
		$Muerte/Anim.play("gameOver")
		get_tree().paused = true
	
	
	
	
func agregarFuel():
	$Fuel.visible = true
	$Fuel.global_position = Vector2(rand_range(0,390),0)

func agregarPolice():
	$Police.visible = true
	$Police/CollisionShape2D.disabled = false
	$Police.global_position = Vector2(rand_range(0,390),0)

func agregarCoin():
	$Coin.visible = true
	$Coin.global_position = Vector2(rand_range(0,390),0)

func agregarTruck():
	$Truck.global_position = Vector2(rand_range(0,390),0)

func agregarOil():
	$Oil.global_position = Vector2(rand_range(0,390),0)


func on_pickedFuel():
	$GUI/ProgressBar.value += 12
	$Fuel.hide()

	
func _on_TimerPolice_timeout():
	if $TimerPolice.is_stopped():
		agregarPolice()
		$TimerPolice.start()
		
func _on_TimerCoin_timeout():
	if $TimerCoin.is_stopped():
		agregarCoin()
		$TimerCoin.start()

		
func on_lowFuel():
	$Police.hide()
	$GUI/ProgressBar.value += -25
	
func on_truckLowFuel():
	$Truck.hide()
	$Truck/CollisionShape2D.disabled
	$GUI/ProgressBar.value += -25
	pass
func on_coinRecolected():
	$Coin.hide()
	puntos += 1 
	puntospc += 1
	$GUI/Puntos.text = str(puntos)
	if puntospc == 10:
		puntospc = 0
		agregarFuel()
		

func _on_TimerTruck_timeout():
	if $TimerTruck.is_stopped():
		agregarTruck()
		$TimerTruck.start()


func _on_ScoreTimer_timeout():
	time += 1
	timepc +=1
	$GUI.updateScore(time)
	if timepc == 25:
		timepc = 0
		agregarFuel()

func on_oilPicked():
	$Oil.hide()
	$Oil/CollisionShape2D.disabled
	$GUI/ProgressBar.value -= 10 
	
		


func _on_TimerOil_timeout():
	if $TimerOil.is_stopped():
		agregarOil()
		$TimerOil.start()
