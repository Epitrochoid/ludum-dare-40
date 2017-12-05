extends LineEdit

var scrollable_terminal = null
onready var vbox_container = self.get_parent().get_parent()
onready var game_actions = preload("res://actions/game.gd").new()
onready var store = get_node("/root/main").get_store()

func _ready():
  self.grab_focus()
  self.connect("text_entered", self, "_on_enter_pressed")

  scrollable_terminal = vbox_container.get_parent()
  scrollable_terminal.set_v_scroll(1000000)

func _on_enter_pressed(some_text):
  var new_terminal_line = load("res://TerminalLine.tscn").instance()
  vbox_container.add_child(new_terminal_line)
  yield(get_tree(), 'idle_frame')
  scrollable_terminal.set_v_scroll(1000000)
  store.dispatch(game_actions.submit_step(some_text))
