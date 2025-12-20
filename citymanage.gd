extends Control

var config = ConfigFile.new()
var city = 0
var amount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_goback)
	$Button2.pressed.connect(_sellbuilding)

func _goback():
	get_tree().change_scene_to_file("res://shop.tscn")
	
func _sellbuilding():
	var save = config.load("user://clicker.cfg")
	if save == OK:
		city = config.get_value("player", "city")
		amount = config.get_value("player", "score")
	if city == 1:
		amount += 60
		city -= 1
		config.set_value("player", "score", amount)
		config.set_value("player", "city", city)
		config.save("user://clicker.cfg")
	get_tree().change_scene_to_file("res://shop.tscn")
