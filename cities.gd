extends Control

var config = ConfigFile.new()
var city = 0
var profit = 0
var gain = 0
var loss = 0
var amount = 0
var stock = 0
var casino = 0
var totalamount = 0
# config.set_value("player", "totalscore", totalamount)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button2.pressed.connect(_goback)
	$city.visible = false
	$Label2.visible = false
	$Button.visible = false
	$Button3.visible = false
	$Stock.visible = false
	$Button4.visible = false
	$Casinobuilding.visible = false
	var save = config.load("user://clicker.cfg")
	if save == OK:
		city = config.get_value("player", "city")
		profit = config.get_value("player", "profit")
		gain = config.get_value("player", "profittotal")
		loss = config.get_value("player", "profitloss")
		stock = config.get_value("player", "stock")
		casino = config.get_value("player", "casino")
		totalamount = config.get_value("player", "totalscore")
	$Label2.text = "Buildings profit: " + str(profit);
	if city == 1 || stock == 1 || casino == 1:
		$Label.visible = false
		$city.visible = true
		$Label2.visible = true
		$Button.visible = true
		$Button.pressed.connect(_collectmoney)
		$Timer.timeout.connect(_giveprofit)
	if stock == 1:
		$Stock.visible = true
		$Button3.visible = true
		$Button3.pressed.connect(_gostocks)
	
	if casino == 1:
		$Casinobuilding.visible = true
		$Button4.visible = true
		$Button4.pressed.connect(_gocasino)
	
func _goback():
	get_tree().change_scene_to_file("res://control.tscn")
	
func _gostocks():
	get_tree().change_scene_to_file("res://stocks.tscn")
	
func _gocasino():
	get_tree().change_scene_to_file("res://casino.tscn")
	
func _giveprofit():
	var random_float = randf()
	if random_float < 0.99:
		profit += 1 + (1 * stock) + (1 * casino)
		gain += 1 + (1 * stock) + (1 * casino)
	elif random_float < 0.95:
		profit -= 2 + (1 * stock) + (1 * casino)
		loss += 2 + (1 * stock) + (1 * casino)
	elif random_float < 0.99:
		profit += 20 + (10 * stock) + (10 * casino)
		gain += 20 + (10 * stock) + (10 * casino)
	else:
		profit -= 50 + (5 * stock) + (5 * casino)
		loss += 50 + (5 * stock) + (5 * casino)
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
		amount += profit
		totalamount += profit
		config.set_value("player", "score", amount)
		profit = 0
		config.set_value("player", "profit", profit)
		config.set_value("player", "totalscore", totalamount)
	config.save("user://clicker.cfg")
	$Label2.text = "Buildings profit: " + str(profit);
