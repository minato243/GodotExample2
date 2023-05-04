extends Node3D

var map:Node3D
var camera:Camera3D

var btnCancel = null
var btnAccept = null

var width: int
var height: int
var cellPosition: Vector2i
var type = null
var avatar = null


func _init():
	super()


# Called when the node enters the scene tree for the first time.
func _ready():
	btnCancel = $"cancel"
	btnAccept = $"accept"
#	if(btnCancel):
#		btnCancel.hide()
#		btnAccept.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateUiButton()


func upgrade():
	pass

func select():
	print("Select")
	showUiButton()
	

func updateUiButton():
	if(btnCancel != null and btnCancel.is_visible_in_tree()):
		var screenPos = camera.unproject_position(position)
		
func setCurMap(curMap):
	self.map = curMap
	self.camera = curMap.myCamera
	
func showUiButton():
	btnCancel.show()
	btnAccept.show()
	
func hideUiButton():
	btnCancel.hide()
	btnAccept.hide()
	
func onAccept():
	print("onAccept")

func onCancel():
	print("onCancel")

func _on_area_3d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("_on_area_3d_area_shape_entered")


func _on_accpet_input_event(camera, event, position, normal, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true):
			onAccept()


func _on_cancel_input_event(camera, event, position, normal, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true):
			onCancel()
