extends Node

var game_actions
var tasks_component
var score_component

func create_button (text):
  var button = Button.new()
  button.set_text(text)
  return button

func on_click (store, task):
  store.dispatch(game_actions.set_current_task(task))

func add_task(store, task):
  var queue_size = store.get_state().game_state.tasks.size()

  if queue_size > 15:
    get_tree().quit()
  else:
    var vbox = get_node("/root/Main/ColorRect/Phone/ScrollContainer/VBoxContainer")

    var name_button = create_button(task.name)

    task.button = name_button

    vbox.add_child(name_button)
    name_button.connect("pressed", self, "on_click", [ store, task ])


func decrease_wait_time (store, task):
  var timer = tasks_component.addTaskTimer
  var wait_time = timer.get_wait_time()
  timer.set_wait_time(wait_time - 1)
  tasks_component.remove_child(task.button)
  task.button.queue_free()
  score_component.set_text(str(store.get_state().game_state.score))


func _ready ():
  game_actions = preload("res://actions/game.gd").new()
  tasks_component = get_node("/root/Main/ColorRect/Phone/ScrollContainer/VBoxContainer/Container")
  score_component = get_node("/root/Main/ColorRect/ScoreCount")

  score_component.set_text(str(0))
