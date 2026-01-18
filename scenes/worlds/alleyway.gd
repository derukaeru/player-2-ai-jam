extends Node3D

func _on_door_interacted(interactable):
	Global.change_world(1, interactable, 7.463, 0.2)
