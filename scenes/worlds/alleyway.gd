extends Node3D

func _on_door_interacted(interactable):
	Global.change_world(1, interactable, 7.463, 0.2)

func _on_dumpster_interacted(_interactable):
	Global.gn("speech_bubble").play("A dumpster. It has glass shards on top of all the smelly garbage.")
