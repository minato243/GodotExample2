extends Node3D

var TownHall = preload("res://modules/buildings/TownHall.tscn")
var Storage = preload("res://modules/buildings/Storage.tscn")
var config = null

# Called when the node enters the scene tree for the first time.
func _ready():
	loadConfig()
	initMap()
		

func loadConfig():
	var file = FileAccess.open("res://configs/Map.json", FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	config = data
	print(data["map1"])
	
func initMap():
	print("*** "+ JSON.stringify(config["map1"]))
	for obj in config["map1"]["objects"]:
		print("*** "+ JSON.stringify(obj))
		var building = null
		match obj["id"]:
			"TOW_1":
				building = TownHall.instantiate()
			"STO_2":
				building = Storage.instantiate()
		if(building != null):
			building.position = Vector3(obj.iso_pos[0].x, 0, obj.iso_pos[0].y)
			add_child(building)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
