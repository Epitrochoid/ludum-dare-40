extends Object

var _state = {}
var _reducer_map = {}
var _middleware_funcs = []

signal state_changed(state)

func get_state ():
  return _state

func dispatch (action):
  print("DISPATCHING", action)
  for reducer_name in _reducer_map.keys():
    var state = _state[reducer_name]
    var reducer = _reducer_map[reducer_name]
    var next_state = reducer.call_func(state, action)
    print(next_state)
    if (next_state != state):
      _state[reducer_name] = next_state
      emit_signal("state_changed", _state)
  print(_middleware_funcs.size())
  for middleware in _middleware_funcs:
    middleware.call_func(self, action)

func subscribe (target, method_name):
  connect("state_changed", target, method_name)

func unsubscribe (target, method_name):
  disconnect("state_changed", target, method_name)

func _init (reducer_map, middlewares):
  for reducer_name in reducer_map.keys():
    var reducer_instance = reducer_map[reducer_name]
    _reducer_map[reducer_name] = funcref(reducer_instance, "reducer")
    _state[reducer_name] = reducer_instance.initial_state

  for middlewareInstance in middlewares:
    var middleware_func = funcref(middlewareInstance, "middleware")
    _middleware_funcs.push_back(middleware_func)
