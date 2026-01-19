extends Control

var checking = false

func _on_player_2ainpc_chat_received(message):
	if int(message) > 0:
		get_tree().change_scene_to_file("res://scenes/ui/end_screen.tscn")
	else:
		pass 
	checking = false

func _on_check_pressed():
	var full_answer = ""
	full_answer += $killer_name.text + " "
	full_answer += $victim_age.text + " "
	full_answer += $victim_name.text + " "
	full_answer += $victim_occupation.text + " "
	
	$Player2AINPC.chat(full_answer)

func _on_close_pressed():
	if not checking:
		hide()
		Global.gn("player").can_move = true
