extends "res://modules/buildings/BuildingOject.gd"

var HenHouse = preload("res://model/plant/wheat_1.glb")	

# Called when the node enters the scene tree for the first time.
func _ready():
	remove_child($"rig")
	avatar = HenHouse.instantiate()
	add_child(avatar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
