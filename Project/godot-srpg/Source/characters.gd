extends Node2D

@onready var tilemap := $"../TileManager/MovementLayer"
var agent : NavigationAgent2D
var activeChar

func show_movement() -> bool:
	for child in get_children():
		if child.selected and child.mouseOver:
			activeChar = child
			agent = child.get_node("NavigationAgent2D")
			print(agent)
			#get_reachable_cells(child.global_position,12)
			var B = highlight_reachable()
			if B: return true
			pass
	return false
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		var isTrue = show_movement()
		if isTrue:
			pass

func get_reachable_cells(start_pos: Vector2, max_steps: int) -> Array:
	var start_cell = tilemap.local_to_map(start_pos)
	var frontier = [start_cell]
	var visited = {start_cell: 0}
	var reachable = []

	while frontier.size() > 0:
		var current = frontier.pop_front()
		var dist = visited[current]

		if dist > max_steps:
			continue

		reachable.append(current)

		for dir in [Vector2i(1,0), Vector2i(-1,0), Vector2i(0,1), Vector2i(0,-1)]:
			var next = current + dir
			if next in visited:
				continue

			if is_cell_reachable(next):
				visited[next] = dist + 1
				frontier.append(next)

	return reachable


func is_cell_reachable(cell: Vector2i) -> bool:
	var world_pos = tilemap.map_to_local(cell)
	agent.target_position = world_pos
	return agent.is_target_reachable()


func highlight_reachable():
	tilemap.clear()
	var cells = get_reachable_cells(agent.get_parent().global_position, 6)

	for c in cells:
		if $"../TileManager/TileMapLayer".get_cell_source_id(c) == -1:
			continue
		if activeChar.yourTeam:
			tilemap.set_cell(c, 0, Vector2i(1,1))  # highlight tile
		else:
			tilemap.set_cell(c, 0, Vector2i(0,1))
