extends Node

func gm(): return get_tree().current_scene
func gn(id): return get_tree().get_first_node_in_group(id)

func ia(id): return Input.is_action_pressed(id)

func dialog(text):
	var ii = gn("speech_bubble")
	if not ii: return
	ii.play(text)
	
	
