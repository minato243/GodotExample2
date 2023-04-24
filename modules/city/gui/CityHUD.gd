extends Control

@onready var buttonShop = $"btnShop"
# Called when the node enters the scene tree for the first time.
func _ready():
	var button = buttonShop
	button.pressed.connect(self._button_pressed)

func _button_pressed():
	print("Hello world!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
