extends Sprite2D

const BACK = preload("res://Assets/imgs/card/back_card.png")
const FRONT = preload("res://Assets/imgs/card/front_card.png")
@onready var sprite = $Sprite2D

var flp = 0

func _on_button_pressed():
	flip()

func flip():
	if flp:
		sprite.visible = 0
		texture = BACK
	else:
		sprite.visible = 1
		texture = FRONT
	flp = !flp
