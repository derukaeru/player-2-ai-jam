extends Node3D

func _on_interactable_interacted(interactable):
	Global.change_world(1, interactable, -7.759, 0.52)

func _on_body_interacted(_interactable):
	Global.gn("speech_bubble").play("The victim. Her body sustained a blunt force trauma in her back and neck. The blood comes from wounds on her hands and legs.")

func _on_broken_window_interacted(_interactable):
	Global.gn("speech_bubble").play("A broken window. There are no glass shards inside nor outside.")

func _on_blood_drops_interacted(_interactable):
	Global.gn("speech_bubble").play("Footsteps. Filled with blood. It doesn't look like the victim's size.")
