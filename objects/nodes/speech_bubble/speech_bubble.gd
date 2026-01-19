extends TextEdit

@onready var timer = $Timer

func play(message : String):
	self.show()
	self.scale = Vector2(1, 0)
	self.create_tween().tween_property(self, "scale", Vector2(1, 1), 0.5).set_trans(Tween.TRANS_EXPO)
	self.text = message

func _ready():
	self.hide()

func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			self.create_tween().tween_property(self, "scale", Vector2(1, 0), 0.5).set_trans(Tween.TRANS_EXPO)
			Global.gn("player").can_move = true
