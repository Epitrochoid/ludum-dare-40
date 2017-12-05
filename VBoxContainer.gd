extends VBoxContainer

onready var store = get_node("/root/main").get_store()

var current_task = { "id": -10000 }

func create_label (input_text):
  var label = Label.new()
  label.set_text(input_text)
  return label

func on_state_change (state):
  var task = state.game_state.current_task
  if (task && current_task != task):
    current_task = task
    var label = create_label(task.name)
    add_child(label)
    current_task.label = label
    current_task.container = self
    for step in task.steps:
      var step_label = create_label(step.description)
      add_child(step_label)

func _ready():
  store.subscribe(self, "on_state_change")
  var new_terminal_line = load("res://TerminalLine.tscn").instance()
  self.add_child(new_terminal_line)
