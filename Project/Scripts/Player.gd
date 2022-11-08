extends KinematicBody2D

var speed = 600 # This variable determines how quickly the car will move.
var rotation_speed = 8 # This variable determines how quickly the car will turn.
var walk_mode = false # This variable determines the movement mode of the player. Walk mode allows the player to directly move in each of the 4 cardinal directions.


var velocity = Vector2() # This is a placeholder variable that holds the player's velocity.
var rotation_direction = 0 # This is a placeholder variable that holds tha player rotation offset.

var window_dimensions = Vector2() # This is a placeholder variable that will hold the dimensions of the output window. 

onready var player_variables = get_node("/root/PlayerVariables") # Load the global player variables.

func _ready(): # This function runs when the node first loads into the scene.
	player_variables.score = 0 # Reset the global score variable to 0.

func get_input(): # This function is used to determine the velocity and rotation direction based on user input.
	if Input.is_action_pressed("ui_cancel"): # Check to see if the user is pressing the cancel/escape key.
		get_tree().change_scene("res://Scenes/Menu.tscn") # Return to the main menu.
		
	rotation_direction = 0 # This is a placeholder variable that will hold this rotation direction.
	velocity = Vector2() # This is a placeholder variable that will hold the movement direction.
	
	if (walk_mode == false): # If walk mode is disabled, use "car" movement behavior.
		if Input.is_action_pressed("ui_right"): # Check to see if the user is pressing right.
			rotation_direction += 1 # Indicate to turn to the right.
		if Input.is_action_pressed("ui_left"): # Check to see if the user is pressing left.
			rotation_direction -= 1 # Indicate to turn to the left.
		if Input.is_action_pressed("ui_down"): # Check to see if the user is pressing back.
			velocity = Vector2(-speed, 0).rotated(rotation) # Inidicate to move backwards.
		if Input.is_action_pressed("ui_up"): # Check to see if the user is pressing up.
			velocity = Vector2(speed, 0).rotated(rotation) # Indicate to move forward.
	elif (walk_mode == true): # If walk mode is enabled, use "walk" movement behavior.
		if Input.is_action_pressed("ui_right"): # Check to see if the user is pressing right.
			velocity.x += 1 # Indicate to move right.
		if Input.is_action_pressed("ui_left"): # Check to see if the user is pressing left.
			velocity.x -= 1 # Indicate to move left.
		if Input.is_action_pressed("ui_down"): # Check to see if the user is pressing down.
			velocity.y += 1 # Indicate to move up.
		if Input.is_action_pressed("ui_up"): # Check to see if the user is pressing up.
			velocity.y -= 1 # Indicate to move down.
		velocity = velocity.normalized() * speed # Set the velocity at a consistent speed based on the user inputs.


func _physics_process(delta): # This function runs on a consistent physics clock.
	get_input() # Get the user's input using the function defined previously.
	rotation += rotation_direction * rotation_speed * delta # Apply rotation to the player as determined in the input function.
	velocity = move_and_slide(velocity) # Apply movement to the player as determined in the input function.


func _process(delta): # This function is executed every frame.
	window_dimensions = OS.get_window_size() # Get the window dimensions.
	
	# Check to see if the user is outside of the playable area.
	if (self.position[0] < 0): # Check to see if the player is out of bounds to the left of the playable area.
		self.position[0] = 0 # Reset the player's location to the left-most part of the playable area.
	elif (self.position[0] > window_dimensions[0] * 0.85): # Check to see if the player is out of bounds to the right of the playable area.
		self.position[0] = window_dimensions[0] * 0.85 # Reset the player's location to the right-most part of the playable area.
	elif (self.position[1] < 0): # Check to see if the player is out of bounds to the top  of the playable area.
		self.position[1] = 0 # Reset the player's location to the top-most part of the playable area.
	elif (self.position[1] > window_dimensions[1]): # Check to see if the player is out of bounds to the bottom  of the playable area.
		self.position[1] = window_dimensions[1] # Reset the player's location to the bottom-most part of the playable area.
