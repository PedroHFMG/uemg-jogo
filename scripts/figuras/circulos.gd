extends Node2D


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if AutoLoad.pontuacao == 2:
		$CanvasLayer/Completo.visible = true
		$Button.visible = true

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")
