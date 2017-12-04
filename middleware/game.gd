extends Node

var action_types
var task_effects

func middleware (store, action):
  print("middleware func called")
  match action.type:
    action_types.ADD_TASK:
      task_effects.add_task(store, action.task)
    action_types.SET_CURRENT_TASK:
      pass

func _init ():
  action_types = preload("res://action_types/game.gd").new()
  task_effects = preload("res://effects/task.gd").new()
  add_child(task_effects)
