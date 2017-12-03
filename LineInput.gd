extends LineEdit

var scrollable_terminal = null
var vbox_container = null

func _ready():
	self.grab_focus()
	self.connect("text_entered", self, "_on_enter_pressed")

	vbox_container = self.get_parent().get_parent()
	scrollable_terminal = vbox_container.get_parent()
	scrollable_terminal.set_v_scroll(1000000)

func _on_enter_pressed(someText):
	var new_terminal_line = load("res://TerminalLine.tscn").instance()
	vbox_container.add_child(new_terminal_line)
	yield(get_tree(), 'idle_frame')
	scrollable_terminal.set_v_scroll(1000000)

