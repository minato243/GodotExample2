extends Node3D

var map:Node3D
var camera:Camera3D

var btnCancel = null

var width: int
var height: int
var cellPosition: Vector2i
var type = null
var avatar = null


func _init():
	super()


# Called when the node enters the scene tree for the first time.
func _ready():
	print("_ready")
	btnCancel = $"btn_cancel"
	print("btnCancel")
	print(btnCancel)
	if(btnCancel):
		btnCancel.hide()

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
		btnCancel.position = screenPos;
		
func setCurMap(curMap):
	self.map = curMap
	self.camera = curMap.myCamera
	
func showUiButton():
	btnCancel.show()
