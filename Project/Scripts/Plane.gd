extends KinematicBody2D


var plane_cooldown = 3 # This is the length of time between planes spawning.


var speed = 600 + (200 - randi() % 400)

var velocity = Vector2() # This is a placeholder that will hold the velocity of the node.
var window_dimensions = Vector2() # This is a placeholder variable that will hold the dimensions of the output window. 
var random_position = 0 # This is a placeholder that will be used to pick a random corner for the node.
var random_rotate_increment = 0.0001*(50 - randi() % 100) # This is a random increment interval that the node will be rotated by each frame.
var random_scaling_factor = 1 + (0.01*(50 - randi() % 100)) # This is a random factor centered around '1' that determines the scale of the node.

func _ready(): # Called when the node enters the scene tree for the first time.
	self.scale = Vector2(random_scaling_factor, random_scaling_factor) # Set the scale of the node based on the randomly selected scaling factor.
	
	if (random_rotate_increment < 0): # Check to see if this plane is turning left.
		self.scale = Vector2(self.scale[0], -self.scale[1]) # Invert the sprite so it leans to the appropriate side. This assume the sprite leans to the right by default.
	
	random_position = randi() % 4 # Pick a random number between 0 and 3.
	window_dimensions = OS.get_window_size() # Get the window dimensions.
	if (random_position == 0): # Place the node at the bottom right of the window.
		self.position = Vector2(int(window_dimensions[0]) + 300, int(window_dimensions[1]) + 300)
	elif (random_position == 1): # Place the node at the top right of the window.
		self.position = Vector2(int(window_dimensions[0]) + 300, 0 - 300)
	elif (random_position == 2): # Place the node at the bottom right of the window.
		self.position = Vector2(0 - 300, int(window_dimensions[1]) + 300)
	elif (random_position == 3): # Place the node at the bottom right of the window.
		self.position = Vector2(0 - 300, 0 - 300)
	
	self.rotation_degrees = randi() % 360 # Pick a random direction for this node.
	
	yield(get_tree().create_timer(plane_cooldown), "timeout") # Wait before starting the next round.
	var plane_node = load("res://Nodes/Plane.tscn") # Load the plane node.
	var plane_instance = plane_node.instance() # Create a new instance of the plane node.
	get_parent().add_child(plane_instance) # Add the instance to the scene.

func _process(delta):
	self.rotation += random_rotate_increment # Rotate the direction by the randomly selected rotation increment.
	
func _physics_process(delta):
	velocity = move_and_slide(Vector2(speed, 0).rotated(self.rotation))
