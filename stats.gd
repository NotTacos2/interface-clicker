extends Control

var config = ConfigFile.new()
var total = 0
var clicked = 0
var gain = 0
var loss = 0
var city = 0
var spent = 0
var cps = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_goback)
	$Button2.pressed.connect(_goachievements)
	var save = config.load("user://clicker.cfg")
	if save == OK:
		total = config.get_value("player", "totalscore")
		clicked = config.get_value("player", "clicked")
		gain = config.get_value("player", "profittotal")
		loss = config.get_value("player", "profitloss")
		spent = config.get_value("player", "totalspent")
		city = config.get_value("player", "city")
		cps = config.get_value("player", "cps")
		
	$Label.text = "Total Clicked: " + str(total)
	$Label2.text = "You Clicked: " + str(clicked)
	$Label5.text = "Total Money Spent: " + str(spent)
	$Label6.text = "CPS (Clicks Per Second): " + str(cps)
	$Label3.visible = false
	$Label4.visible = false
	if city == 1:
		$Label3.visible = true
		$Label4.visible = true
		$Label3.text = "Buildings Profit Earned: " + str(gain)
		$Label4.text = "Buildings Profit Lost: " + str(loss)
	
func _goachievements():
	get_tree().change_scene_to_file("res://achievements.tscn")
	
func _goback():
	get_tree().change_scene_to_file("res://control.tscn")
