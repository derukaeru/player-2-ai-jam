extends Node3D

func _on_interactable_interacted(interactable):
	Global.change_world(1, interactable, -7.0, 1.33)
