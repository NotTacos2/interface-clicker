extends Control

var config = ConfigFile.new()
var amount = 0
var newamount = 0
var item = 0
var robot = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
		item = config.get_value("player", "golditem")
	if item == 1:
		$Button2.text = "Golden Clicker V2
		                (40 Points)"
	$Button.pressed.connect(_goback)
	$Button2.pressed.connect(_buygolden)
	$Button3.pressed.connect(_buyrobot)
	$Label2.text = "Points: " + str(amount)
	
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
		newamount = amount - 40
	else:
		newamount = amount - 20
	config.set_value("player", "score", newamount)
	if item == 1:
		config.set_value("player", "golditem", 2)
	else:
		config.set_value("player", "golditem", 1)
	config.save("user://clicker.cfg")
	$Label2.text = "Points: " + str(newamount)
	
func _buyrobot():
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
		robot = config.get_value("player", "robot")
	if robot == 1:
		$Button3.text = "You already have one"
		return
	if amount < 40:
		$Button3.text = "You don't have any money to buy this"
		return
	newamount = amount - 40
	config.set_value("player", "score", newamount)
	config.set_value("player", "robot", 1)
	config.save("user://clicker.cfg")
	$Label2.text = "Points: " + str(newamount)
