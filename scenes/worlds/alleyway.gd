extends Node3D

func _on_door_interacted(interactable):
	Global.change_world(1, interactable, 7.463, 0.2)
	Global.gm().get_node("rain").volume_db = -28.0

func _on_dumpster_interacted(_interactable):
	Global.gn("speech_bubble").play("A dumpster. It has glass shards on top of all the smelly garbage.")


func _on_interactable_interacted(_interactable):
	Global.gn("camera_rig").get_node("Camera3D/gui/deduction_screen").show()
	Global.gn("player").can_move = false
