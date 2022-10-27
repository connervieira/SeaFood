extends Node

onready var player_variables = get_node("/root/PlayerVariables") # Load the global player variables.

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().root.get_node("Control").get_node("Subtitle").text = "You saved " + str(player_variables.score) + " turtles!" # Set the subtitle to display the player's score.

func _on_BackButton_pressed(): # When the back button is pressed, load the main menu.
	get_tree().change_scene("res://Scenes/Menu.tscn") # Load the main menu.
