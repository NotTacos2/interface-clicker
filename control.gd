extends Control
var amount = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_buttonpressed)
	$Button2.pressed.connect(_button2pressed)
	print("Initalized!") # idk how to spell

		
func _buttonpressed():
	amount += 1
	$Label2.text = "Clicked: " + str(amount);
	if amount == 100:
		$Label3.text = "ooo 100"
	if amount == 200:
		$Label3.text = "200 nice"
		
func _button2pressed():
	get_tree().change_scene_to_file("res://shop.tscn")
