extends Container

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var store = get_node("/root/main").get_store()
onready var game_actions = preload("res://actions/game.gd").new()
onready var dict_util = preload("res://util/dict_util.gd").new()
onready var task_id = 0

onready var addTaskTimer = Timer.new()

var task_pool = [
  {
    "name": "cowsay for days",
    "steps": [
      {
        "description": "Type \"cowsay hi\"",
        "condition": "cowsay hi"
      }
    ]
  },
  {
    "name": "cat for days",
    "steps": [
      {
        "description": "Type \"cat fix.txt\"",
        "condition": "cat fix.txt"
      }
    ]
  }
]

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
    addTaskTimer.set_wait_time(5)
    addTaskTimer.connect("timeout", self, "_on_add_task_timeout")
    addTaskTimer.set_one_shot(false)
    add_child(addTaskTimer)
    addTaskTimer.start()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
#
func _on_add_task_timeout():
  var task_pos = randi() % 2
  var task = dict_util.shallow_copy(task_pool[task_pos])
  task.steps = [] + task.steps
  task_id = task_id + 1
  task.id = task_id

  store.dispatch(game_actions.add_task(task))
