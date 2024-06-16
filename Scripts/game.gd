extends Node2D

@onready var cards = $Cards

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

func _ready():
	for child in cards.get_children():
		crs.append(child)
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
