extends Node2D

func _ready():
	$CanvasLayer2/Background.modulate.a = 0
	$CanvasLayer2/Algas.modulate.a = 0
	$CanvasLayer2/Algas2.modulate.a = 0
	$CanvasLayer2/Peixe.modulate.a = 0
	yield(get_tree().create_timer(1.5), "timeout")
	var tween = create_tween()
	tween.tween_property($CanvasLayer/Label, "modulate", Color.transparent, 1)

func _process(delta):
	if AutoLoad.pontuacao == 7:
		$CanvasLayer/Mesa.visible = false
		$CanvasLayer/Mesa2.visible = false
		$CanvasLayer2.visible = true
		var tween2 = create_tween()
		var tween3 = create_tween()
		tween2.tween_property($CanvasLayer2/Background, "modulate", Color.white, 1)
		tween3.tween_property($CanvasLayer2/Peixe, "modulate", Color.white, 1)
		tween2.tween_property($CanvasLayer2/Algas, "modulate", Color.white, 1)
		tween3.tween_property($CanvasLayer2/Algas2, "modulate", Color.white, 1)
		self.visible = false
		$CanvasLayer3.visible = true

func _on_Timer_timeout():
	self.visible = true
	$CanvasLayer/Label.visible = false

func _on_Button_pressed():
	AutoLoad.pontuacao = 0
	get_tree().change_scene("res://scenes/menu.tscn")

func _on_bt_pausa_pressed():
	$CanvasLayer4.visible = true
	self.visible = false

func _on_bt_retomar_pressed():
	$CanvasLayer4.visible = false
	self.visible = true

func _on_bt_sair_pressed():
	AutoLoad.pontuacao = 0
	get_tree().change_scene("res://scenes/menu.tscn")
