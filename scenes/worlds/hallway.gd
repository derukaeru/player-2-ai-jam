extends Node3D

func _on_outside_door_interacted(interactable):
	Global.change_world(0, interactable, -5.099, 3)

func _on_apartment_door_interacted(interactable):
	Global.change_world(2, interactable, -5.074, -0.128)


func _on_plant_interacted(_interactable):
	Global.gn("speech_bubble").play("A knocked out plant. It fell facing inside.")


func _on_blood_streaks_interacted(_interactable):
	Global.gn("speech_bubble").play("A streak of blood. Almost like something was being dragged here.")
