extends Control

var config = ConfigFile.new()
var amount = 0
var chips = 0
var spent = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button2.pressed.connect(_goback)
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
		spent = config.get_value("player", "totalspent")
		chips = config.get_value("player", "chips")
	$Label2.text = "Clicked: " + str(amount)
	
func _goback():
	get_tree().change_scene_to_file("res://casino.tscn")
	
func _buychips10():
	if amount < 10:
		$Button2.text = "You don't have money for this"
	amount -= 10
	
