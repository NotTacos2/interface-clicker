extends Control

var config = ConfigFile.new()
var amount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button2.pressed.connect(_goback)
	$Button.pressed.connect(_coinflip)
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
	
func _goback():
	get_tree().change_scene_to_file("res://cities.tscn")

func _coinflip():
	if amount < 5:
		return
	amount -= 5
	var wtvcoinis = randf()
	if wtvcoinis <= 0.5:
		amount += 10
	else:
		print("ggs")
