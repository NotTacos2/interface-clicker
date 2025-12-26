extends Control

var config = ConfigFile.new()
var stockamount = 0
var amount = 0
var stockearned = 0
var stocklost = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var save = config.load("user://clicker.cfg")
	if save == OK:
		stockamount = config.get_value("player", "stockamount")
		amount = config.get_value("player", "score")
		stockearned = config.get_value("player", "stockearned")
		stocklost = config.get_value("player", "stocklost")
	$Button2.pressed.connect(_goback)
	$Button.pressed.connect(_buystock)
	$Button3.pressed.connect(_buytenstock)
	$Button4.pressed.connect(_buyhundredstock)
	$Button5.visible = false
	$Label2.text = "Clicked: " + str(amount)
	$Label.text = "Stocks: " + str(stockamount)
	
	if stockamount >= 1:
		$Timer.timeout.connect(_stockmarket)
		$Button5.visible = true
		$Button5.pressed.connect(_sellall)
	
func _goback():
	get_tree().change_scene_to_file("res://cities.tscn")
	
func _buystock():
	if amount < 5:
		return
	amount -= 5
	stockamount += 1
	config.set_value("player", "stockamount", stockamount)
	config.set_value("player", "score", amount)
	config.save("user://clicker.cfg")
	$Label.text = "Stocks: " + str(stockamount)
	
	
func _buytenstock():
	if amount < 45:
		return
	amount -= 45
	stockamount += 10
	config.set_value("player", "stockamount", stockamount)
	config.set_value("player", "score", amount)
	config.save("user://clicker.cfg")
	
func _buyhundredstock():
	if amount < 475:
		return
	amount -= 475
	stockamount += 100
	config.set_value("player", "stockamount", stockamount)
	config.set_value("player", "score", amount)
	config.save("user://clicker.cfg")
	
func _stockmarket():
	var random_float = randf()
	if random_float <= 0.5:
		if stockamount > 1:
			stockamount -= (stockamount * 1)
			stocklost += (stockamount * 1)
		else:
			stockamount = 1
	else:
		stockamount += (stockamount + 1)
		stockearned += (stockamount + 1)
	config.set_value("player", "stockamount", stockamount)
	config.set_value("player", "stockearned", stockearned)
	config.set_value("player", "stocklost", stocklost)
	config.save("user://clicker.cfg")
	$Label.text = "Stocks: " + str(stockamount)
	
func _sellall():
	stockamount = 0
	amount += stockamount
	config.set_value("player", "score", amount)
	config.set_value("player", "stockamount", stockamount)
	config.save("user://clicker.cfg")
	$Label.text = "Stocks: 0"
