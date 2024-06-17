extends Node2D

@onready var cards = $Cards
@onready var timer = $Timer
@onready var label = $CanvasLayer/Label
@onready var color_rect_2 = $ColorRect2
@onready var label_2 = $ColorRect2/Label2

var crs = []

const APPLE = preload("res://Assets/imgs/pics/apple.png")
const BANANA = preload("res://Assets/imgs/pics/banana.png")
const CAT = preload("res://Assets/imgs/pics/cat.png")
const DIAMOND = preload("res://Assets/imgs/pics/diamond.png")
const DOG = preload("res://Assets/imgs/pics/dog.png")
const DUCK = preload("res://Assets/imgs/pics/duck.png")
const MAN = preload("res://Assets/imgs/pics/man.png")
const MOON = preload("res://Assets/imgs/pics/moon.png")
const PAC = preload("res://Assets/imgs/pics/pac.png")
const PLANE = preload("res://Assets/imgs/pics/plane.png")
const PXL_HEART = preload("res://Assets/imgs/pics/pxl_heart.png")
const RABBIT = preload("res://Assets/imgs/pics/rabbit.png")
const ROSE = preload("res://Assets/imgs/pics/rose.png")
const TREE = preload("res://Assets/imgs/pics/tree.png")
const WATERMELON = preload("res://Assets/imgs/pics/watermelon.png")

var pcs = [APPLE,APPLE,BANANA,BANANA,CAT,CAT,DIAMOND,DIAMOND,DOG,DOG,DUCK,DUCK,MAN,MAN,MOON,MOON,PAC,PAC,PLANE,PLANE,PXL_HEART,PXL_HEART,RABBIT,RABBIT,ROSE,ROSE,TREE,TREE,WATERMELON,WATERMELON]

var scr = 0

func _ready():
	for child in cards.get_children():
		crs.append(child)
		child.text.connect(score)
	distribute()

func set_card(crd,text):
	crd.sprite.texture = text
	crd.sprite.scale.x = 20/float(text.get_width())
	crd.sprite.scale.y = 20/float(text.get_height())

func distribute():
	var idx
	randomize()
	for card in crs:
		idx = randi()%(pcs.size())
		set_card(card,pcs[idx])
		pcs.remove_at(idx)

var cnt = 0
var last_card
var succeed
var num_success = 0

func score(text):
	if cnt == 0:
		last_card = text
	elif cnt == 1:
		if last_card == text:
			succeed = 1
			timer.start()
		else:
			succeed = 0
			timer.start()
	cnt += 1
	cnt %= 2

func success():
	num_success += 1
	scr += 10
	for crd in crs:
		if crd.flp:
			if crd.visible:
				crd.visible = 0
	set_score()
	if num_success == 15:
		color_rect_2.visible = 1
		label_2.text = "You Scored " + str(int(scr))

func fail():
	scr -= 5
	if scr < 0:
		scr = 0
	for crd in crs:
		if crd.flp:
			if crd.visible:
				crd.flip()
	set_score()


func _on_timer_timeout():
	if succeed:
		success()
	else:
		fail()

func set_score():
	label.text = "Score: " + str(int(scr))
