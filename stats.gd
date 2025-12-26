extends Control

var config = ConfigFile.new()
var total = 0
var clicked = 0
var gain = 0
var loss = 0
var city = 0
var spent = 0
var sold = 0
var stock = 0
var rebirth = 0
var complete = 0
var casino = 0
var stockearned = 0
var stocklost = 0
var casinoearned = 0
var casinolost = 0

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
		sold = config.get_value("player", "sold")
		stock = config.get_value("player", "stock")
		rebirth = config.get_value("player", "rebirth")
		complete = config.get_value("player", "complete")
		casino = config.get_value("player", "casino")
		stockearned = config.get_value("player", "stockearned")
		stocklost = config.get_value("player", "stocklost")
		casinoearned = config.get_value("player", "casinoearned")
		casinolost = config.get_value("player", "casinolost")
		
	$Label.text = "Total Clicked: " + str(total)
	$Label2.text = "You Clicked: " + str(clicked)
	$Label5.text = "Total Money Spent: " + str(spent)
	$Label7.text = "Rebirths: " + str(rebirth)
	$Label8.text = "Completion: " + str(complete) + "%"
	$Label3.visible = false
	$Label4.visible = false
	$Label6.visible = false
	$Label9.visible = false
	$Label10.visible = false
	$Label11.visible = false
	$Label12.visible = false
	if city == 1 || stock == 1 || casino == 1:
		$Label3.visible = true
		$Label4.visible = true
		$Label6.visible = true
		$Label3.text = "Buildings Profit Earned: " + str(gain)
		$Label4.text = "Buildings Profit Lost: " + str(loss)
		$Label6.text = "Buildings sold: " + str(sold)
	if stock == 1:
		$Label9.visible = true
		$Label10.visible = true
		$Label9.text = "Stock Profit Earned: " + str(stockearned)
		$Label10.text = "Stock Profit Lost: " + str(stocklost)
	if casino == 1:
		$Label11.visible = true
		$Label12.visible = true
		$Label11.text = "Casino Profit Earned: " + str(casinoearned)
		$Label12.text = "Casino Profit Lost: " + str(casinolost)
		
	
func _goachievements():
	get_tree().change_scene_to_file("res://achievements.tscn")
	
func _goback():
	get_tree().change_scene_to_file("res://control.tscn")
