extends Control

var config = ConfigFile.new()
var city = 0
var profit = 0
var gain = 0
var loss = 0
var amount = 0
var newamount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button2.pressed.connect(_goback)
	$city.visible = false
	$Label2.visible = false
	$Button.visible = false
	var save = config.load("user://clicker.cfg")
	if save == OK:
		city = config.get_value("player", "city")
		profit = config.get_value("player", "profit")
		gain = config.get_value("player", "profittotal")
		loss = config.get_value("player", "profitloss")
	$Label2.text = "Buildings profit: " + str(profit);
	if city == 1:
		$Label.visible = false
		$city.visible = true
		$Label2.visible = true
		$Button.visible = true
		$Button.pressed.connect(_collectmoney)
		$Timer.timeout.connect(_giveprofit)
	
func _goback():
	get_tree().change_scene_to_file("res://control.tscn")
	
func _giveprofit():
	var random_float = randf()
	if random_float < 0.9:
		profit += 1
		gain += 1
	elif random_float < 0.95:
		profit -= 2
		loss += 2
	elif random_float < 0.99:
		profit += 20
		gain += 20
	else:
		profit -= 50
		loss += 50
	config.set_value("player", "profit", profit)
	config.set_value("player", "profittotal", gain)
	config.set_value("player", "profitloss", loss)
	config.save("user://clicker.cfg")
	$Label2.text = "Buildings profit: " + str(profit);
	
func _collectmoney():
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
		profit = config.get_value("player", "profit")
		
	if city == 1:
		newamount = amount + profit
		config.set_value("player", "score", newamount)
		profit = 0
		config.set_value("player", "profit", profit)
	config.save("user://clicker.cfg")
	$Label2.text = "Buildings profit: " + str(profit);
