extends Node

var game_actions

func create_button (text):
  var button = Button.new()
  button.set_text(text)
  return button

func on_click (store, task):
  store.dispatch(game_actions.set_current_task(task))

func add_task(store, task):
  var vbox = get_node("/root/Main/ColorRect/Phone/ScrollContainer/VBoxContainer")

  var name_button = create_button(task.name)

  vbox.add_child(name_button)
  name_button.connect("pressed", self, "on_click", [ store, task ])

func _init ():
  game_actions = preload("res://actions/game.gd").new()
