extends Control
var config = ConfigFile.new()
var amount = 0
var totalamount = 0
var item = 0
var robot = 0
var clicked = 0
var rebirth = 0
var city = 0
var complete = 0
var stock = 0
var onetime = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false
	$Label3.visible = false
	$Button6.visible = false
	$Button.pressed.connect(_buttonpressed)
	$Button2.pressed.connect(_button2pressed)
	$Button3.pressed.connect(_gotocities)
	$Button4.pressed.connect(_settingsbuttonpressed)
	$Button5.pressed.connect(_gotostats)
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
		item = config.get_value("player", "golditem")
		robot = config.get_value("player", "robot")
		totalamount = config.get_value("player", "totalscore")
		clicked = config.get_value("player", "clicked")
		onetime = config.get_value("player", "onetime")
		rebirth = config.get_value("player", "rebirth")
		city = config.get_value("player", "city")
		stock = config.get_value("player", "stock")
		complete = config.get_value("player", "complete")
		
	if robot >= 1:
		$Timer.timeout.connect(_addpointforrobot)
		
	if item >= 2 && rebirth < 10:
		$Button6.visible = true
		$Button6.pressed.connect(_rebirth)
		
	if complete == 100:
		$Label3.visible = true
		$Label3.text = "You have completed the game, great job!"
		
	if amount >= 100: # theme_override_colors/font_color # theme_override_colors/font_hover_color
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
	if amount >= 500:
		$Button.add_theme_color_override("font_color", Color(23.237, 0.0, 0.0, 1.0))
		$Button.add_theme_color_override("font_hover_color", Color(23.237, 0.0, 0.0, 1.0))
		$Button.add_theme_color_override("font_focus_color", Color(23.237, 0.0, 0.0, 1.0))
		$Button.add_theme_color_override("font_hover_pressed_color", Color(23.237, 0.0, 0.0, 1.0))
		$Button.add_theme_color_override("font_pressed_color", Color(23.237, 0.0, 0.0, 1.0))
	if amount >= 1000:
		$Button.add_theme_color_override("font_color", Color(206, 206, 0, 1.0))
		$Button.add_theme_color_override("font_hover_color", Color(206, 206, 0, 1.0))
		$Button.add_theme_color_override("font_focus_color", Color(206, 206, 0, 1.0))
		$Button.add_theme_color_override("font_hover_pressed_color", Color(206, 206, 0, 1.0))
		$Button.add_theme_color_override("font_pressed_color", Color(206, 206, 0, 1.0))
	$Label2.text = "Clicked: " + str(amount);
	
	
func _buttonpressed():
	amount += 1 + (0.5 * rebirth)
	totalamount += 1 + (0.5 * rebirth)
	clicked += 1
	if item == 1:
		amount += 1 + (0.5 * rebirth)
		totalamount += 1
	if item == 2:
		amount += 2 + (0.5 * rebirth)
		totalamount += 2
	$Label2.text = "Clicked: " + str(amount);
	config.set_value("player", "score", amount)
	config.set_value("player", "totalscore", totalamount)
	config.set_value("player", "clicked", clicked)
	if clicked >= 1000:
		if onetime == false: # IDK HOW ELSE TO FIX IT
			config.set_value("player", "1000achievement", true)
			config.set_value("player", "onetime", true)
			$Label.visible = true
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
	if amount >= 500:
		$Button.add_theme_color_override("font_color", Color(23.237, 0.0, 0.0, 1.0))
		$Button.add_theme_color_override("font_hover_color", Color(23.237, 0.0, 0.0, 1.0))
		$Button.add_theme_color_override("font_focus_color", Color(23.237, 0.0, 0.0, 1.0))
		$Button.add_theme_color_override("font_hover_pressed_color", Color(23.237, 0.0, 0.0, 1.0))
		$Button.add_theme_color_override("font_pressed_color", Color(23.237, 0.0, 0.0, 1.0))
	if amount >= 1000:
		$Button.add_theme_color_override("font_color", Color(206, 206, 0, 1.0))
		$Button.add_theme_color_override("font_hover_color", Color(206, 206, 0, 1.0))
		$Button.add_theme_color_override("font_focus_color", Color(206, 206, 0, 1.0))
		$Button.add_theme_color_override("font_hover_pressed_color", Color(206, 206, 0, 1.0))
		$Button.add_theme_color_override("font_pressed_color", Color(206, 206, 0, 1.0))
		
func _button2pressed():
	get_tree().change_scene_to_file("res://shop.tscn")
	
func _settingsbuttonpressed():
	get_tree().change_scene_to_file("res://mainmenu.tscn")
	
func _gotocities():
	get_tree().change_scene_to_file("res://cities.tscn")

func _gotostats():
	get_tree().change_scene_to_file("res://stats.tscn")
	
func _addpointforrobot():
	var save = config.load("user://clicker.cfg")
	if save == OK:
		item = config.get_value("player", "golditem")
	amount += 1 + (robot * 0.5) + (0.5 * rebirth)
	totalamount += 1 + (robot * 0.5) + (0.5 * rebirth)
	if item == 1:
		amount += 1 + (robot * 0.5) + (0.5 * rebirth)
		totalamount += 1
	if item == 2:
		amount += 2 + (robot * 0.5) + (0.5 * rebirth)
		totalamount += 2
	config.set_value("player", "score", amount)
	config.set_value("player", "totalscore", totalamount)
	config.set_value("player", "clicked", clicked)
	config.save("user://clicker.cfg")
	$Label2.text = "Clicked: " + str(amount);
	
func _rebirth():
	var save = config.load("user://clicker.cfg")
	if save == OK:
		rebirth = config.get_value("player", "rebirth")
		complete = config.get_value("player", "complete")
	rebirth += 1
	complete += 10
	amount = 0
	item = 0
	robot = 0
	config.set_value("player", "score", 0)
	config.set_value("player", "golditem", 0)
	config.set_value("player", "robot", 0)
	config.set_value("player", "city", 0)
	config.set_value("player", "profit", 0)
	config.set_value("player", "stock", 0)
	config.set_value("player", "rebirth", rebirth)
	config.set_value("player", "complete", complete)
	config.save("user://clicker.cfg")
	$Label.visible = true
	$Label3.visible = true
	$Button6.visible = false
	if complete == 100:
		$Label3.text = "You have now completed the game, great job!"
