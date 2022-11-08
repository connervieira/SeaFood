extends KinematicBody2D

var speed = 600 + (200 - randi() % 400)

var velocity = Vector2() # This is a placeholder that will hold the velocity of the node.
var window_dimensions = Vector2() # This is a placeholder variable that will hold the dimensions of the output window. 
var random_position = 0 # This is a placeholder that will be used to pick a random corner for the node.
var random_rotate_increment = 0.0001*(50 - randi() % 100) # This is a random increment interval that the node will be rotated by each frame.
var random_scaling_factor = 1 + (0.01*(50 - randi() % 100)) # This is a random factor centered around '1' that determines the scale of the node.

func _ready(): # Called when the node enters the scene tree for the first time.
	self.scale = Vector2(random_scaling_factor, random_scaling_factor) # Set the scale of the node based on the randomly selected scaling factor.
	
	random_position = randi() % 4 # Pick a random number between 0 and 3.
	window_dimensions = OS.get_window_size() # Get the window dimensions.
	if (random_position == 0): # Place the node at the bottom right of the window.
		self.position = Vector2(int(window_dimensions[0]) + 100, int(window_dimensions[1]) + 100)
	elif (random_position == 1): # Place the node at the top right of the window.
		self.position = Vector2(int(window_dimensions[0]) + 100, 0 - 100)
	elif (random_position == 2): # Place the node at the bottom right of the window.
		self.position = Vector2(0 - 100, int(window_dimensions[1]) + 100)
	elif (random_position == 3): # Place the node at the bottom right of the window.
		self.position = Vector2(0 - 100, 0 - 100)
	
	self.rotation_degrees = randi() % 360 # Pick a random direction for this node.

func _process(delta):
	self.rotation += random_rotate_increment # Rotate the direction by the randomly selected rotation increment.
	
func _physics_process(delta):
	velocity = move_and_slide(Vector2(speed, 0).rotated(self.rotation))
