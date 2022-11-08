extends Node

var window_dimensions = Vector2() # This is a placeholder variable that will hold the dimensions of the output window. 

var random_color = 0 # This is a placeholder that will be used to pick a random color for the umbrella

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Pick a random color for this umbrella.
	random_color = randi() % 6
	if (random_color == 0): # Remove all colors except red.
		self.get_node("Green").queue_free()
		self.get_node("Purple").queue_free()
		self.get_node("Blue").queue_free()
		self.get_node("Yellow").queue_free()
	elif (random_color == 1): # Remove all colors except blue.
		self.get_node("Green").queue_free()
		self.get_node("Purple").queue_free()
		self.get_node("Red").queue_free()
		self.get_node("Yellow").queue_free()
	elif (random_color == 2): # Remove all colors except purple.
		self.get_node("Green").queue_free()
		self.get_node("Blue").queue_free()
		self.get_node("Red").queue_free()
		self.get_node("Yellow").queue_free()
	elif (random_color == 3): # Remove all colors except green.
		self.get_node("Purple").queue_free()
		self.get_node("Blue").queue_free()
		self.get_node("Red").queue_free()
		self.get_node("Yellow").queue_free()
	elif (random_color == 4): # Remove all colors except yellow.
		self.get_node("Purple").queue_free()
		self.get_node("Blue").queue_free()
		self.get_node("Red").queue_free()
		self.get_node("Green").queue_free()
	elif (random_color == 6): # Remove all colors except red.
		self.get_node("Green").queue_free()
		self.get_node("Purple").queue_free()
		self.get_node("Blue").queue_free()
		self.get_node("Yellow").queue_free()
		
	# Pick a random location for this umbrella.
	window_dimensions = OS.get_window_size() # Get the window dimensions.
	self.position = Vector2((randi() % int(window_dimensions[0]*0.85)), (randi() % int(window_dimensions[1]))) # Place this node at a random location within the bounds of the window.
	self.rotation_degrees = randi() % 360

func _on_Umbrella_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass
