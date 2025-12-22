extends Control

var config = ConfigFile.new()
var city = 0
var amount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var save = config.load("user://clicker.cfg")
	if save == OK:
		city = config.get_value("player", "city")
		amount = config.get_value("player", "score")
	$Button.pressed.connect(_goback)
	$Button2.pressed.connect(_sellbuilding)
	$Button3.visible = false
	if city == 1:
		$Button3.visible = true

func _goback():
	get_tree().change_scene_to_file("res://shop.tscn")
	
func _sellbuilding():
	if city == 1:
		amount += 60
		city -= 1
		config.set_value("player", "score", amount)
		config.set_value("player", "city", city)
		config.save("user://clicker.cfg")
	get_tree().change_scene_to_file("res://shop.tscn")
	
func _buystock():
	if amount < 100:
		$Button4.text = "You don't have any money to buy this"
		return
	amount -= 100
	config.set_value("player", "score", amount)
	config.set_value("player", "city", 2)
	config.save("user://clicker.cfg")
	$Label2.text = "Clicks: " + str(amount)
