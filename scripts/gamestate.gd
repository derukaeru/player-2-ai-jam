extends Node

var discovered_clues: Array = []
var heard_statements: Array = []
var proven_contradictions: Array = []
var flags: Dictionary = {}

signal clue_added(id)
signal statement_added(id)
signal contradiction_added(id)

func add_clue(clue_id: String) -> void:
	if clue_id in discovered_clues:
		return
	discovered_clues.append(clue_id)
	emit_signal("clue_added", clue_id)

func add_statement(statement_id: String) -> void:
	if statement_id in heard_statements:
		return
	heard_statements.append(statement_id)
	emit_signal("statement_added", statement_id)

func add_contradiction(contradiction_id: String) -> void:
	if contradiction_id in proven_contradictions:
		return
	proven_contradictions.append(contradiction_id)
	emit_signal("contradiction_added", contradiction_id)

func set_flag(flag_name: String, value) -> void:
	flags[flag_name] = value

func get_flag(flag_name: String) -> bool:
	return flags.get(flag_name, false)
