extends Object

var _state = {}
var _reducerMap = {}

signal state_changed(state)

func get_state ():
  return _state

func dispatch (action):
  for reducer_name in _reducerMap.keys():
    var state = _state[reducer_name]
    var reducer = _reducerMap[reducer_name]
    var next_state = reducer.call_func(state, action)
    print(next_state)
    if (next_state != state):
      _state[reducer_name] = next_state
      emit_signal("state_changed", _state)

func subscribe (target, method_name):
  connect("state_changed", target, method_name)

func unsubscribe (target, method_name):
  disconnect("state_changed", target, method_name)

func _init (reducerMap):
  for reducer_name in reducerMap.keys():
    var reducerInstance = reducerMap[reducer_name]
    _reducerMap[reducer_name] = funcref(reducerInstance, "reducer")
    _state[reducer_name] = reducerInstance.initial_state
