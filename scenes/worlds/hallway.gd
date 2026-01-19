extends Node3D

func _on_outside_door_interacted(interactable):
	Global.change_world(0, interactable, -5.099, 3)

func _on_apartment_door_interacted(interactable):
	Global.change_world(2, interactable, -5.074, -0.128)
