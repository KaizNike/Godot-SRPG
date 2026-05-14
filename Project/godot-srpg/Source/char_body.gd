extends AnimatableBody2D

@export var yourTeam := false
@export var selected := false


func _on_mouse_entered() -> void:
	if not yourTeam:
		$Polygon2D.color = Color.RED
		$Polygon2D.color.a -= 20
	$Polygon2D.visible = true
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	$Polygon2D.visible = false
	pass # Replace with function body.


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		selected = true
		$Polygon2D.color.a = 255
	pass # Replace with function body.
