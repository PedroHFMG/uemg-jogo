extends Node2D

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/Label.text = str(AutoLoad.pontuacao)
	
	if AutoLoad.pontuacao == 1:
		$CanvasLayer/Button3.visible = true

func _on_Button_pressed():
	AutoLoad.pontuacao = AutoLoad.pontuacao + 1

func _on_Button2_pressed():
	$CanvasLayer/Button3.visible = false
	AutoLoad.pontuacao = 0

func _on_Button3_pressed():
	AutoLoad.pontuacao = 0
	get_tree().change_scene("res://scenes/menu.tscn")
