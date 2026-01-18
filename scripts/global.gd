extends Node

var curr_world = 0

func gm(): return get_tree().current_scene
func gn(id): return get_tree().get_first_node_in_group(id)

func ia(id): return Input.is_action_pressed(id)

func dialog(text):
	var ii = gn("speech_bubble")
	if not ii: return
	ii.play(text)

func change_world(id, n, x, z):
	if curr_world == id: return
	for a in gn("player").get_node("detectable").get_overlapping_areas():
		if a.name == n.name: 
			for c in gm().get_node("world").get_children():
				c.queue_free()
			
			if id == 0:
				gm().get_node("world").add_child(load("res://scenes/worlds/alleyway.tscn").instantiate())
				gn("camera_rig").alley_config()
			elif id == 1:
				gm().get_node("world").add_child(load("res://scenes/worlds/hallway.tscn").instantiate())
				gn("camera_rig").hallway_config()
			elif id == 2:
				gm().get_node("world").add_child(load("res://scenes/worlds/room.tscn").instantiate())
				gn("camera_rig").room_config()
			
			gn("player").position.x = x
			gn("player").position.z = z
			
			curr_world = id
	
