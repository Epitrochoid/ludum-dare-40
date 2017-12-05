extends Node

var action_types
var task_effects

func middleware (store, action):
  var state = store.get_state().game_state
  match action.type:
    action_types.ADD_TASK:
      task_effects.add_task(store, action.task)
    action_types.SET_CURRENT_TASK:
      pass
    action_types.SUBMIT_STEP:
      var current_task = state.current_task
      if current_task.steps.size() == 0:
        task_effects.decrease_wait_time(store, current_task)

func _init ():
  action_types = preload("res://action_types/game.gd").new()
  task_effects = preload("res://effects/task.gd").new()
  add_child(task_effects)
