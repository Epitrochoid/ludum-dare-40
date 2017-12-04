func add_task(task):
    var store = get_load("/root/main").get_store()
    store.get_state().game_state.append(task)
