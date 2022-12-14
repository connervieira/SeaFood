extends Node

var window_dimensions = Vector2() # This is a placeholder variable that will hold the dimensions of the output window. 
var random_scaling_factor = 1.5 + (0.001*(50 - randi() % 100)) # This is a random factor centered around '1' that determines the scale of the node.

onready var player_variables = get_node("/root/PlayerVariables") # Load the global player variables.

# Called when the node enters the scene tree for the first time.
func _ready():
	window_dimensions = OS.get_window_size() # Get the window dimensions.
	self.position = Vector2((randi() % int(window_dimensions[0]*0.85)), (randi() % int(window_dimensions[1]))) # Place this node at a random location within the bounds of the window.
	self.rotation_degrees = randi() % 360
	self.scale = Vector2(random_scaling_factor, random_scaling_factor)

func _on_Trash_body_shape_entered(body_rid, body, body_shape_index, local_shape_index): # Detect when the player collides with this node..
	player_variables.score = player_variables.score + 1 # Increment the player's score by 1 point.
	queue_free() # Delete the trash object.
