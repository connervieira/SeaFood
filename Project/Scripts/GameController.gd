extends Node

var rounds = 6 # This is how many rounds will be played.
var drop_size = 20 # This is how many pieces of trash will be placed each round.
var cooldown = 7.0 # This is how many seconds between rounds.

var umbrella_count = 5 + randi() % 5 # This is how many umbrellas will spawn at the beginning of the game
var plane_count = 0 # This is how many planes will spawn at the beginning of the game.


func _ready(): # This function is executed when the scene first loads.
	var trash_node = load("res://Nodes/Trash.tscn") # Load the trash node.
	var umbrella_node = load("res://Nodes/Umbrella.tscn") # Load the umbrella node.
	var plane_node = load("res://Nodes/Plane.tscn") # Load the plane node.
	
	var plane_instance = plane_node.instance() # Create a new instance of the plane node.
	add_child(plane_instance) # Add the instance to the scene.
	
	for n1 in range(0, umbrella_count): # Loop for each umbrella placement.
		var umbrella_instance = umbrella_node.instance() # Create a new instance of the umbrella node.
		add_child(umbrella_instance) # Add the instance to the scene.
	
	for n1 in range(0, rounds): # Loop for each round.
		for n2 in range(0, drop_size): # Loop for each trash placement.
			var trash_instance = trash_node.instance() # Create a new instance of the trash node.
			add_child(trash_instance) # Add the instance to the scene.
			
		yield(get_tree().create_timer(cooldown), "timeout") # Wait before starting the next round.
		
	get_tree().change_scene("res://Scenes/End.tscn") # After the last round finished, load the end screen.
