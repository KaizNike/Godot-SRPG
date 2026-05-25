extends AnimatableBody2D

@export var yourTeam := false
@export var selected := false
var mouseOver := false

@export var charName := "Regii"

func _ready() -> void:
	$AllyPopup/UnitStat/PanelContainer/VSplitContainer/HBoxContainer/Name.text = charName
	$FoePopup/UnitStat/PanelContainer/VSplitContainer/HBoxContainer/Name.text = charName

func _on_mouse_entered() -> void:
	mouseOver = true
	if not yourTeam:
		$Polygon2D.color = Color.RED
		$Polygon2D.color.a -= 20
		$FoePopup.visible = true
	else:
		$AllyPopup.visible = true
	$Polygon2D.visible = true
	
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	mouseOver = false
	if not selected:
		$Polygon2D.visible = false
		$AllyPopup.visible = false
		$FoePopup.visible = false
	pass # Replace with function body.


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and mouseOver:
		selected = true
		
		if yourTeam:
			$Polygon2D.color = Color.NAVY_BLUE
		else:
			$Polygon2D.color = Color.BROWN
			#$AllyPopup.popup()
		#else:
			#$FoePopup.popup()
			
		$Polygon2D.color.a = 255
		$Polygon2D.visible = true
	pass # Replace with function body.
