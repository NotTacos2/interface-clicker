extends Control
var config = ConfigFile.new()
var amount = 0
var item = 0
var robot = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_buttonpressed)
	$Button2.pressed.connect(_button2pressed)
	$Button4.pressed.connect(_settingsbuttonpressed)
	print("Initalized!") # idk how to spell
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
		item = config.get_value("player", "golditem")
		robot = config.get_value("player", "robot")
	
	# if robot == 2:
		#$Timer.stop()
		#$Timer.wait_time = 0.5
		#$Timer.start()
	$Timer.timeout.connect(_addpointforrobot)
		
	if amount >= 100: # theme_override_colors/font_color # theme_override_colors/font_hover_color
		$Button.add_theme_color_override("font_color", Color(0.91, 0.90, 0.41, 1))
		$Button.add_theme_color_override("font_hover_color", Color(0.91, 0.90, 0.41, 1))
		$Button.add_theme_color_override("font_hover_pressed_color", Color(0.91, 0.90, 0.41, 1))
		$Button.add_theme_color_override("font_pressed_color", Color(0.91, 0.90, 0.41, 1))
	if amount >= 200:
		$Button.add_theme_color_override("font_color", Color(0.948, 0.264, 0.583, 1.0))
		$Button.add_theme_color_override("font_hover_color", Color(0.948, 0.264, 0.583, 1.0))
		$Button.add_theme_color_override("font_hover_pressed_color", Color(0.948, 0.264, 0.583, 1.0))
		$Button.add_theme_color_override("font_pressed_color", Color(0.948, 0.264, 0.583, 1.0))
	if amount >= 300:
		$Button.add_theme_color_override("font_color", Color(0.394, 0.19, 0.798, 1.0))
		$Button.add_theme_color_override("font_hover_color", Color(0.394, 0.19, 0.798, 1.0))
		$Button.add_theme_color_override("font_hover_pressed_color", Color(0.394, 0.19, 0.798, 1.0))
		$Button.add_theme_color_override("font_pressed_color", Color(0.394, 0.19, 0.798, 1.0))
	$Label2.text = "Clicked: " + str(amount);
	
	
func _buttonpressed():
	amount += 1
	if item == 1:
		amount += 1
	if item == 2:
		amount += 2
	$Label2.text = "Clicked: " + str(amount);
	config.set_value("player", "score", amount)
	config.save("user://clicker.cfg")
	if amount >= 100:
		$Button.add_theme_color_override("font_color", Color(0.91, 0.90, 0.41, 1))
		$Button.add_theme_color_override("font_hover_color", Color(0.91, 0.90, 0.41, 1))
		$Button.add_theme_color_override("font_focus_color", Color(0.91, 0.90, 0.41, 1))
		$Button.add_theme_color_override("font_hover_pressed_color", Color(0.91, 0.90, 0.41, 1))
		$Button.add_theme_color_override("font_pressed_color", Color(0.91, 0.90, 0.41, 1))
	if amount >= 200:
		$Button.add_theme_color_override("font_color", Color(0.948, 0.264, 0.583, 1.0))
		$Button.add_theme_color_override("font_hover_color", Color(0.948, 0.264, 0.583, 1.0))
		$Button.add_theme_color_override("font_focus_color", Color(0.948, 0.264, 0.583, 1.0))
		$Button.add_theme_color_override("font_hover_pressed_color", Color(0.948, 0.264, 0.583, 1.0))
		$Button.add_theme_color_override("font_pressed_color", Color(0.948, 0.264, 0.583, 1.0))
	if amount >= 300:
		$Button.add_theme_color_override("font_color", Color(0.394, 0.19, 0.798, 1.0))
		$Button.add_theme_color_override("font_hover_color", Color(0.394, 0.19, 0.798, 1.0))
		$Button.add_theme_color_override("font_focus_color", Color(0.394, 0.19, 0.798, 1.0))
		$Button.add_theme_color_override("font_hover_pressed_color", Color(0.394, 0.19, 0.798, 1.0))
		$Button.add_theme_color_override("font_pressed_color", Color(0.394, 0.19, 0.798, 1.0))
func _button2pressed():
	get_tree().change_scene_to_file("res://shop.tscn")
	
func _settingsbuttonpressed():
	get_tree().change_scene_to_file("res://settings.tscn")
	
func _addpointforrobot():
	var save = config.load("user://clicker.cfg")
	if save == OK:
		robot = config.get_value("player", "robot")
		item = config.get_value("player", "golditem")
	if robot == 1:
		amount += 1
		if item == 1:
			amount += 1
		if item == 2:
			amount += 2
		config.set_value("player", "score", amount)
		config.save("user://clicker.cfg")
		$Label2.text = "Clicked: " + str(amount);
