extends Node

func _process(delta): # This function is executed every frame.
	if Input.is_action_pressed("ui_accept"): # Check to see if the user is pressing the "accept" key.
		get_tree().change_scene("res://Scenes/Game.tscn") # Load the main game scene.

func _on_StartButton_pressed(): # This function is executed when the start button is pressed.
	get_tree().change_scene("res://Scenes/Game.tscn") # Load the main game scene.
