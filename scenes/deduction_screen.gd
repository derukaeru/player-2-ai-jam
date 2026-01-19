extends Control

func _on_player_2ainpc_chat_received(message):
	if int(message) > 0:
		pass
	else:
		pass 

func _on_check_pressed():
	var full_answer = ""
	full_answer += $killer_name.text + " "
	full_answer += $cause.text + " "
	full_answer += $victim_age.text + " "
	full_answer += $victim_name.text + " "
	full_answer += $victim_occupation.text + " "
	
	$Player2AINPC.chat(full_answer)
