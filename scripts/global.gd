extends Node

var curr_world = 0

func gm(): return get_tree().current_scene
func gn(id): return get_tree().get_first_node_in_group(id)

func ia(id): return Input.is_action_pressed(id)

func dialog(text):
	var ii = gn("speech_bubble")
	if not ii: return
	ii.play(text)

func change_world(id):
	if curr_world == id: return
	
	for c in gm().get_node("world").get_children():
		c.queue_free()
	
	gn("player").position.z = 0.0
	
	if id == 0:
		gm().get_node("world").add_child(load("res://scenes/worlds/alleyway.tscn").instantiate())
		gn("camera_rig").alley_config()
	elif id == 1:
		gm().get_node("world").add_child(load("res://scenes/worlds/hallway.tscn").instantiate())
		gn("camera_rig").room_config()
	elif id == 2:
		gm().get_node("world").add_child(load("res://scenes/worlds/room.tscn").instantiate())
		gn("camera_rig").room_config()
	
	curr_world = id
	
