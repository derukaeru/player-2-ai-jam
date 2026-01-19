@tool
extends Control

@export var button : Button
@export var text : TextEdit
@export var chat_container : Control
@export var scroll_container : ScrollContainer
@export var thinking : CanvasItem

@export var focus_on_show : bool = true
@export var deselect_on_send : bool = false
@export var show_history : bool = true

signal text_sent(text : String)

func _ready() -> void:
	if Engine.is_editor_hint():
		return

	button.pressed.connect(send)
	# Make enter key send a message too
	text.gui_input.connect(
		func(event : InputEvent):
			if event is InputEventKey:
				# Enter: submit shortcut
				if event.pressed and event.keycode == KEY_ENTER:
					text.accept_event()
					send()
					self.hide()
				if event.pressed and event.keycode == KEY_ESCAPE:
					self.hide()
					Global.gn("player").can_move = true
	)

	self.visibility_changed.connect(func():
		if visible and focus_on_show:
			text.grab_focus()
	)

func _send(txt : String) -> void:
	self.text.text = ""
	if deselect_on_send:
		self.text.release_focus()
	text_sent.emit(txt)

func send() -> void:
	_send(text.text)
	
