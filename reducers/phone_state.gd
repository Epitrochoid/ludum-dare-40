var action_types
var dict_util

const initial_state = {
  "open": true
}

func reducer (state, action):
  var type = action.type
  var new_state
  match type:
    action_types.OPEN:
      new_state = dict_util.shallow_copy(state)
      new_state.open = true
      return new_state
    action_types.CLOSE:
      new_state = dict_util.shallow_copy(state)
      new_state.open = false
      return new_state
  return state

func _init ():
  action_types = preload("res://action_types/phone.gd").new()
  dict_util = preload("res://util/dict_util.gd")
