extends Node

var rounds = 3 # This is how many rounds will be played.
var drop_size = 40 # This is how many pieces of trash will be placed each round.
var cooldown = 10.0 # This is how many seconds between rounds.


func _ready(): # This function is executed when the scene first loads.
	var trash_node = load("res://Nodes/Trash.tscn") # Load the trash prefab.
	for n1 in range(0, rounds): # Loop for each round.
		for n2 in range(0, drop_size): # Loop for each trash placement.
			var instance = trash_node.instance() # Create a new instance of the trash prefab.
			add_child(instance) # Add the instance to the scene.
			
		yield(get_tree().create_timer(cooldown), "timeout") # Wait before starting the next round.
		
	get_tree().change_scene("res://Scenes/End.tscn") # After the last round finished, load the end screen.
