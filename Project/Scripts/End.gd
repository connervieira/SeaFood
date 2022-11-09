extends Node

onready var player_variables = get_node("/root/PlayerVariables") # Load the global player variables.
var animals_saved = 0
var years_saved = 0


func comma_separate(number):
	var string = str(number)
	var mod = string.length() % 3
	var formatted_number = ""
	for i in range(0, string.length()):
		if i != 0 && i % 3 == mod:
			formatted_number += ","
		formatted_number += string[i]
	return formatted_number


# Called when the node enters the scene tree for the first time.
func _ready():
	for n1 in range(0, player_variables.score): # Loop for each bottle picked up.
		if (randi() % 4 == 3): # This has a roughly 25% change of running, which is very similar to the true 27% chance of a bottle killing a marine animal.
			animals_saved = animals_saved + 1
		years_saved = comma_separate(player_variables.score * (450 + (randi() % 10) - 5))

	get_tree().root.get_node("Control").get_node("Subtitle").text = "You saved " + str(animals_saved) + " animals.\nYou picked up " + str(player_variables.score) + " bottles.\nYou kept " + str(years_saved) + " years of plastic out of the ocean." # Set the subtitle to display the player's statistics.

func _on_BackButton_pressed(): # When the back button is pressed, load the main menu.
	get_tree().change_scene("res://Scenes/Menu.tscn") # Load the main menu.
