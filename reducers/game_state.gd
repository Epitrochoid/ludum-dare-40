var action_types
var dict_util

var initial_state = {
  "tasks": [],
  "current_task": null
}

func reducer (state, action):
  var type = action.type
  var new_state

  match type:
    action_types.ADD_TASK:
      new_state = dict_util.shallow_copy(state)
      new_state.tasks.append(action.task)
      return new_state
    action_types.SET_CURRENT_TASK:
      new_state = dict_util.shallow_copy(state)
      new_state.current_task = action.task
      return new_state

  return state

func _init ():
  action_types = preload("res://action_types/game.gd").new()
  dict_util = preload("res://util/dict_util.gd")
