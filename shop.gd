extends Control

var config = ConfigFile.new()
var amount = 0
var item = 0
var robot = 0
var city = 0
var spent = 0
var stock = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
		item = config.get_value("player", "golditem")
		robot = config.get_value("player", "robot")
		city = config.get_value("player", "city")
		spent = config.get_value("player", "totalspent")
		stock = config.get_value("player", "stock")
	if item >= 1:
		$Button2.text = "Golden Clicker V2
		                 (40 Clicks)"
	if robot >= 1:
		$Button3.text = "Another Robot
		                 (60 Clicks)"
	if city == 1 || stock == 1:
		$Button4.text = "Manage Buildings"
	$Button.pressed.connect(_goback)
	$Button2.pressed.connect(_buygolden)
	$Button3.pressed.connect(_buyrobot)
	if city >= 1:
		$Button4.pressed.connect(_managecity)
	else:
		$Button4.pressed.connect(_buycity)
	$Label2.text = "Clicked: " + str(amount)
	
func _goback():
	get_tree().change_scene_to_file("res://control.tscn")

func _buygolden():
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
		item = config.get_value("player", "golditem")
	if item == 2:
		$Button2.text = "You already have too much"
		return
	if item == 1 && amount < 40:
		$Button2.text = "You don't have any money to buy this"
		return
	if amount < 20:
		$Button2.text = "You don't have any money to buy this"
		return
	if item == 1:
		amount -= 40
		spent += 40
	else:
		amount -= 20
		spent += 20
	config.set_value("player", "score", amount)
	config.set_value("player", "totalspent", spent)
	if item == 1:
		config.set_value("player", "golditem", 2)
	else:
		config.set_value("player", "golditem", 1)
	config.save("user://clicker.cfg")
	$Button2.text = "Golden Clicker V2
		                 (40 Clicks)"
	$Label2.text = "Clicked: " + str(amount)
	
func _buycity():
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
		city = config.get_value("player", "city")
	if amount < 60:
		$Button4.text = "You don't have any money to buy this"
		return
	if city == 1:
		$Button4.text = "You already have this"
		return
	amount -= 60
	spent += 60
	config.set_value("player", "totalspent", spent)
	config.set_value("player", "score", amount)
	config.set_value("player", "city", 1)
	config.save("user://clicker.cfg")
	$Label2.text = "Clicked: " + str(amount)
	
func _managecity():
	get_tree().change_scene_to_file("res://citymanage.tscn")
	
func _buyrobot():
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
		robot = config.get_value("player", "robot")
	if robot == 2:
		$Button3.text = "You already have too much"
		return
	if robot == 1 && amount < 60:
		$Button3.text = "You don't have any money to buy this"
		return
	if amount < 40:
		$Button3.text = "You don't have any money to buy this"
		return
	if robot == 1:
		amount -= 60
		spent += 60
	else:
		amount -= 40
		spent += 40
	config.set_value("player", "score", amount)
	config.set_value("player", "totalspent", spent)
	if item == 1:
		config.set_value("player", "robot", 2)
	else:
		config.set_value("player", "robot", 1)
	config.save("user://clicker.cfg")
	$Label2.text = "Clicked: " + str(amount)
