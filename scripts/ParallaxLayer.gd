extends ParallaxLayer

var speed = 700

func _process(delta):
	get_parent().scroll_offset.y += speed * delta
