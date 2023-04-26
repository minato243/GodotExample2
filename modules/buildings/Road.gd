extends "res://modules/buildings/BuildingOject.gd"

var Avatar = preload("res://model/Ground/ground_3x3.glb")	

# Called when the node enters the scene tree for the first time.
func _ready():
	remove_child($"rig")
	avatar = Avatar.instantiate()
	add_child(avatar)
	avatar.position = Vector3(0, 0, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
