extends Control

func _ready():
	pass

func _on_bt_tangram_pressed():
	$CanvasLayer2/VBoxContainer2.visible = true
	$CanvasLayer2/VBoxContainer.visible = false

func _on_bt_sair_pressed():
	get_tree().quit()

func _on_bt_voltar_pressed():
	$CanvasLayer2/VBoxContainer2.visible = false
	$CanvasLayer2/VBoxContainer.visible = true

func _on_bt_gato_pressed():
	get_tree().change_scene("res://scenes/tangram/gato.tscn")

func _on_bt_peixe_pressed():
	get_tree().change_scene("res://scenes/tangram/peixe.tscn")

func _on_bt_barco_pressed():
	get_tree().change_scene("res://scenes/tangram/barco.tscn")

func _on_bt_foguete_pressed():
	get_tree().change_scene("res://scenes/tangram/foguete.tscn")
