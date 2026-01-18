extends Area3D
class_name Interactable

signal interacted(interactable)

enum InteractableType {
	NPC,
	CLUE,
	ENVIRONMENT,
	OFFICER,
	DOOR
}

@export var interactable_type : InteractableType
@export var interact_id : String
@export var display_name : String
@export var one_shot := true

var used := false
var hovered := false

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	input_event.connect(_on_input_event)

func _on_mouse_entered():
	hovered = true
	_show_highlight(true)

func _on_mouse_exited():
	hovered = false
	_show_highlight(false)

func _on_input_event(_camera, event, _pos, _normal, _shape):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		interact()

func interact():
	if one_shot and used:
		return
	used = true
	emit_signal("interacted", self)

func _show_highlight(_enabled: bool):
	pass
