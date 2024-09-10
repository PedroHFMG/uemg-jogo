extends Area2D

const grid = 16
var mouse_entrou = false
var is_clicked = false
var encaixe = false
var of = Vector2.ZERO
var pos_inicial = Vector2.ZERO
var obj_pos = Vector2.ZERO
var obj: Array
var scale_self = Vector2.ZERO
var scale_math = Vector2(0.05, 0.05)

func _ready():
	scale_self = scale
	set_meta("quad", true)
	add_to_group("figuras")
	pos_inicial = global_position
	randomize()
	self.modulate = AutoLoad.ColorArray[randi() % AutoLoad.ColorArray.size() - 1]

func _process(delta):
	if Input.is_action_just_pressed("click"):
		of = get_global_mouse_position() - global_position
	
	if mouse_entrou and Input.is_action_pressed("click"):
		is_clicked = true
		var posicao = get_global_mouse_position() - of
		position = Vector2(stepify(posicao.x, grid), stepify(posicao.y, grid))

	if Input.is_action_just_released("click") and encaixe == false:
		is_clicked = false
		mouse_entrou = false
		position = pos_inicial
		obj.clear()

	if Input.is_action_just_released("click") and encaixe == true:
		is_clicked = false
		mouse_entrou = false
		
		if global_position != obj[obj.size()-1].global_position:
			position = pos_inicial
			
		if global_position == obj[obj.size()-1].global_position:
			input_pickable = false
			visible = false
			disconnect("mouse_entered", self, "")
			obj.clear()

func _on_Area2D_mouse_entered():
	var new_scale_self = scale_self + scale_math
	scale = new_scale_self
	mouse_entrou = true
	print(scale_self)

func _on_Area2D_mouse_exited():
	scale = scale_self
	if is_clicked == false:
		mouse_entrou = false

func _on_Area2D_area_entered(area):
	if area.has_meta("quad-vazio") and (area.scale + scale_math) == scale:
		encaixe = true
		obj.append(area)
