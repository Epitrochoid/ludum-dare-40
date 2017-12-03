extends VBoxContainer

func _ready():
	var new_terminal_line = load("res://TerminalLine.tscn").instance()
	self.add_child(new_terminal_line)