class_name NPC
extends CharacterBody3D


@export var ai_name : String = ""
@export_multiline var ai_description : String = ""
@export var ai_save_conversation_history : bool = false
@export var ai_character_config : Player2AICharacterConfig = Player2AICharacterConfig.new()
@export_multiline var ai_behaviour:String = ""


func _ready():
	if Engine.is_editor_hint():
		return
		
	$Player2AINPC.character_name = ai_name
	$Player2AINPC.character_description = ai_description
	$Player2AINPC.auto_store_conversation_history = ai_save_conversation_history
	$Player2AINPC.character_config = ai_character_config
	$Player2AINPC.character_system_message = ai_behaviour
	if ai_save_conversation_history:
		$Player2AINPC.load_conversation_history()
	
	

func _process(_delta):
	if Global.gn("player").position.x > self.position.x:
		$AnimatedSprite3D.flip_h = true
	else:
		$AnimatedSprite3D.flip_h = false

func _on_interactable_interacted(_interactable):
	if Global.gn("player").curr_npc == null and not Global.gn("camera_rig").get_node("Camera3D/gui/notebook_ui/TextureRect").visible:
		Global.gn("player").curr_npc = self
		Global.gn("input_interface").show()
		Global.gn("player").can_move = false

func reply(message):
	Global.gn("speech_bubble").play(message)
	Global.gn("player").curr_npc = null

func thinking():
	Global.gn("input_interface").get_node("Thinking Animation").show()

func done_thinking():
	Global.gn("input_interface").hide()
	Global.gn("input_interface").get_node("Thinking Animation").hide()


func _on_enter_apartment_timeout():
	self.hide()
	# play sound

func _on_leave_apartment_timeout():
	self.show()
	$enter_apartment.start()
	# play sound
