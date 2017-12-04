# NOTE: this is preloaded and accessible via get_node("/root/main")
extends Node

var Store = preload("Store.gd")

var game_state = preload("reducers/game_state.gd").new()
var phone_state = preload("reducers/phone_state.gd").new()

var phone_middleware = preload("middleware/phone.gd").new()
var game_middleware = preload("middleware/game.gd").new()

var store

func get_store():
  return store

func _ready ():
  var root = get_tree().get_root()
  var scene = root.get_child(root.get_child_count() - 1)

  scene.add_child(phone_middleware)
  scene.add_child(game_middleware)

  store = Store.new({
    "game_state": game_state,
    "phone_state": phone_state
  }, [
    phone_middleware,
    game_middleware
  ])
