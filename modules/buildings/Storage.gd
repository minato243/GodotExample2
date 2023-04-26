extends "res://modules/buildings/BuildingOject.gd"

var HenHouse = preload("res://model/buildings/HenHouse/hen_house.glb")	

func _init():
	super()
	type = BuildingType.STO

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	remove_child($"rig")
	avatar = HenHouse.instantiate()
	add_child(avatar)
	avatar.position = Vector3(0, 0, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
