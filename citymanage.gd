extends Control

var config = ConfigFile.new()
var city = 0
var amount = 0
var spent = 0
var stock = 0
var sold = 0
var casino = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var save = config.load("user://clicker.cfg")
	if save == OK:
		city = config.get_value("player", "city")
		amount = config.get_value("player", "score")
		spent = config.get_value("player", "totalspent")
		stock = config.get_value("player", "stock")
		sold = config.get_value("player", "sold")
		casino = config.get_value("player", "casino")
		
	$Label2.text = "Clicked: " + str(amount)
	$Button.pressed.connect(_goback)
	$Button2.pressed.connect(_sellbuilding)
	$Button3.visible = false
	if city == 1 && stock == 0:
		$Button3.visible = true
		$Button3.pressed.connect(_buystock)
		
	if city == 1 || stock == 1:
		if casino == 0:
			$Button4.visible = true
			$Button4.pressed.connect(_buycasino)
		
	if stock == 1:
		$Button3.visible = true
		$Button3.text = "Sell Stock Building #2"
		$Button3.pressed.connect(_sellstock)
		
	if casino == 1:
		$Button4.visible = true
		$Button4.text = "Sell Casino Building #3"
		$Button4.pressed.connect(_sellcasino)

func _goback():
	get_tree().change_scene_to_file("res://shop.tscn")
	
func _sellbuilding():
	if city == 1:
		amount += 60
		city -= 1
		sold += 1
		config.set_value("player", "score", amount)
		config.set_value("player", "sold", sold)
		config.set_value("player", "city", city)
		config.save("user://clicker.cfg")
	get_tree().change_scene_to_file("res://shop.tscn")
	
func _buystock():
	if amount < 100:
		$Button3.text = "You don't have any money to buy this"
		return
	amount -= 100
	spent += 100
	config.set_value("player", "score", amount)
	config.set_value("player", "totalspent", spent)
	config.set_value("player", "stock", 1)
	config.save("user://clicker.cfg")
	$Label2.text = "Clicked: " + str(amount)
	
func _sellstock():
	amount += 100
	sold += 1
	config.set_value("player", "score", amount)
	config.set_value("player", "stock", 0)
	config.set_value("player", "sold", sold)
	config.save("user://clicker.cfg")
	$Label2.text = "Clicked: " + str(amount)
	
func _buycasino():
	if amount < 200:
		return
	amount -= 200
	casino += 1
	config.set_value("player", "score", amount)
	config.set_value("player", "casino", casino)
	config.save("user://clicker.cfg")
	$Label2.text = "Clicked: " + str(amount)
	
func _sellcasino():
	amount += 200
	sold += 1
	config.set_value("player", "score", amount)
	config.set_value("player", "casino", 0)
	config.set_value("player", "sold", sold)
	config.save("user://clicker.cfg")
	$Label2.text = "Clicked" + str(amount)
