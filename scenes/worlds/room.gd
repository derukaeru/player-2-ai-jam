extends Node3D

func _on_interactable_interacted(interactable):
	Global.change_world(1, interactable, -7.759, 0.52)

func _on_body_interacted(_interactable):
	pass # Replace with function body.
