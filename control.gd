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
	
	$Timer.timeout.connect(_addpointforrobot)
		
	if amount >= 100:
		$Label3.text = "ooo 100"
	if amount >= 200:
		$Label3.text = "200 nice"
	if amount >= 300:
		$Label3.text = "wow 300"
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
		$Label3.text = "ooo 100"
	if amount >= 200:
		$Label3.text = "200 nice"
	if amount >= 300:
		$Label3.text = "wow 300"
func _button2pressed():
	get_tree().change_scene_to_file("res://shop.tscn")
	
func _settingsbuttonpressed():
	get_tree().change_scene_to_file("res://settings.tscn")
	
func _addpointforrobot():
	var save = config.load("user://clicker.cfg")
	if save == OK:
		robot = config.get_value("player", "robot")
	if robot == 1:
		amount += 1
		config.set_value("player", "score", amount)
		config.save("user://clicker.cfg")
		$Label2.text = "Clicked: " + str(amount);
