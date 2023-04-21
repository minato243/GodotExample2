extends Camera3D

@export var speed = 14

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector3.ZERO

	# We check for each move input and update the direction accordingly.
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		# Notice how we are working with the vector's x and z axes.
		# In 3D, the XZ plane is the ground plane.
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	
	if Input.is_action_pressed("zoom_in"):
		print("zoom_in")
		direction.y -= 1
	
	if Input.is_action_pressed("zoom_out"):
		direction.y += 1
		print("zoom_out")
		
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	var velocity = Vector3.ZERO
	velocity = direction * speed
	position += velocity*delta
