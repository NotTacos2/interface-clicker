extends Control

var config = ConfigFile.new()
var amount = 0
var newamount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
	$Button.pressed.connect(_goback)
	$Button2.pressed.connect(_buygolden)
	$Label2.text = "Points: " + str(amount)
	
func _goback():
	get_tree().change_scene_to_file("res://control.tscn")

func _buygolden():
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
	newamount = amount - 20
	config.set_value("player", "score", newamount)
	config.set_value("player", "golditem", 1)
	config.save("user://clicker.cfg")
	$Label2.text = "Points: " + str(newamount)
