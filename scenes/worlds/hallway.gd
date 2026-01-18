extends Node3D

func _on_outside_door_interacted(interactable):
	Global.change_world(0)

func _on_apartment_door_interacted(interactable):
	Global.change_world(2)
