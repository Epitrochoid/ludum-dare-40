# NOTE: this is preloaded and accessible via get_node("/root/main")
extends Node

var Store = preload("Store.gd")

var game_state = preload("reducers/game_state.gd").new()
var phone_state = preload("reducers/phone_state.gd").new()
var store

func get_store():
  print(store)
  return store

func _ready ():
  store = Store.new({
    "game_state": game_state,
    "phone_state": phone_state
  })

  print(store.get_state())
