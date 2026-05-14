extends Node2D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		pass


func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var cell = $SelectionLayer.local_to_map(mouse_pos)
	$SelectionLayer.clear()
	$SelectionLayer.set_cell(cell, 0,Vector2i(0,2))  # 0 = your tile ID
