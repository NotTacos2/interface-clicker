extends Control

var config = ConfigFile.new()
var amount = 0
var casinoearned = 0
var casinolost = 0
var totalamount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button2.pressed.connect(_goback)
	$Button.pressed.connect(_coinflip)
	$Button3.pressed.connect(_gochips)
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
		casinoearned = config.get_value("player", "casinoearned")
		casinolost = config.get_value("player", "casinolost")
		totalamount = config.get_value("player", "totalscore")
	
func _goback():
	get_tree().change_scene_to_file("res://cities.tscn")
	
func _gochips():
	get_tree().change_scene_to_file("res://chips.tscn")

func _coinflip():
	if amount < 5:
		$Button.text = "You don't have enough"
		return
	amount -= 5
	var wtvcoinis = randf()
	if wtvcoinis <= 0.5:
		amount += 10
		totalamount += 10
		casinoearned += 10
	else:
		$Label.text = "You lost"
		casinolost -= 5
	config.set_value("player", "score", amount)
	config.set_value("player", "casinoearned", casinoearned)
	config.set_value("player", "casinolost", casinolost)
	config.set_value("player", "totalscore", totalamount)
	config.save("user://clicker.cfg")
