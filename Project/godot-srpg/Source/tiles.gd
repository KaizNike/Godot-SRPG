extends TileMapLayer

#func _input(event: InputEvent) -> void:
	##print(event)
	#if event is InputEventMouseMotion:
		#var loc := self.to_local(DisplayServer.mouse_get_position())
		#var tile = local_to_map(loc)
		#var check = get_cell_source_id(DisplayServer.mouse_get_position())
		#print(loc, tile, check)
		#if check != -1:
			#$"../SelectionLayer".clear()
			#$"../SelectionLayer".set_cell(tile,2,Vector2i(0,2))
		##var cell := get_cell
