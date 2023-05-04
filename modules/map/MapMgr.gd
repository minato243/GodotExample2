extends Node

var TownHall = preload("res://modules/buildings/TownHall.tscn")
var Storage = preload("res://modules/buildings/Storage.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func newBuilding(buildingType):
	print("newBuilding")
	var building = getInstance(buildingType)
	
	
func upgradeBuilding(buildingId):
	pass

func deleteBuilding(buildingId):
	pass
	
func getInstance(buildingTypoe):
	var building = null
	match buildingTypoe:
		"TOW_1":
			print("TOW_1")
			building = TownHall.instantiate()
		"STO_2":
			print("STO_2")
			building = Storage.instantiate()
#		"ROA_1":
#			print("ROA_1")
#			building = Road.instantiate()
#		"FPT_1":
#			print("FPT_1")
#			building = Wheat.instantiate()
	return building
