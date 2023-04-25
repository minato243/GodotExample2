extends Node3D

var TownHall = preload("res://modules/buildings/TownHall.tscn")
var Storage = preload("res://modules/buildings/Storage.tscn")
var Road = preload("res://modules/buildings/Road.tscn")
var Wheat = preload("res://modules/plant/Wheat.tscn")
var config = null

@onready var myCamera = $"Camera3D"
@onready var mainGui = $"CityHUD"

var listBuilding = []


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
	print("*** " + JSON.stringify(config["map1"]))
	for obj in config["map1"]["objects"]:
		print("*** " + JSON.stringify(obj))
		for iso_pos in obj["iso_pos"]:
			var building = getInstance(obj["id"])
			if building != null:
				building = getInstance(obj["id"])
				building.position = Vector3(obj.iso_pos[0].x, 0, obj.iso_pos[0].y)
				add_child(building)
				listBuilding.append(building)
			else:
				break


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func getInstance(buildingTypoe):
	var building = null
	match buildingTypoe:
		"TOW_1":
			building = TownHall.instantiate()
		"STO_2":
			building = Storage.instantiate()
		"ROA_1":
			building = Road.instantiate()
		"FPT_1":
			building = Wheat.instantiate()
	return building


func _input(event):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			print(event.position)
			var mPosition = touch_location(event.position)
			print(mPosition)


func touch_location(position, mask = 1) -> Vector3:
	var camera = myCamera
	var ray_length = 1000
	var ray_start = camera.project_ray_origin(position)
	print(ray_start)
	print(camera.project_ray_normal(position))
	var ray_end = ray_start + camera.project_ray_normal(position) * ray_length
	print(ray_end)
	var ray_normal = ray_end - ray_start
	print(ray_normal)

	var result = Vector3()
	result.y = 0
	result.x = ray_start.x - ray_start.y * ray_normal.x / ray_normal.y
	result.z = ray_start.z - ray_start.y * ray_normal.z / ray_normal.y
	return result


func selectBuilding():
	pass

func getBuildingAtPosition(location):
	for building in listBuilding:
		var rect = Rect2(Vector2(building.position.x, building.position.z), Vector2())
		
