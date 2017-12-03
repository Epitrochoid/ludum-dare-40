extends LineEdit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	grab_focus()
	self.connect("text_entered", self, "_on_enter_pressed")
	pass

func _on_enter_pressed(someText):
	print('input received! ', someText)
	var terminal_node = self.get_parent().get_parent()
	var new_terminal_line = load("res://TerminalLine.tscn").instance()
	terminal_node.add_child(new_terminal_line)


func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
#	append_at_cursor('hello world')
	pass
