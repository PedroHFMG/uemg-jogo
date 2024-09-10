extends Area2D

var obj

func _ready():
	set_meta("quad-vazio", true)
	self.modulate = Color(0, 0, 0, 1)

func _process(delta):
	if obj:
		if obj.global_position == global_position and obj.is_clicked == false:
			AutoLoad.pontuacao += 1
			print("oi")
			obj.queue_free()
			monitorable = false
			monitoring = false
			randomize()
			self.modulate = AutoLoad.ColorArray[randi() % AutoLoad.ColorArray.size()]
			
func _on_Area2D_area_entered(area):
	if area.has_meta("quad"):
		obj = area

func _on_Area2D_area_exited(area):
	obj = null
