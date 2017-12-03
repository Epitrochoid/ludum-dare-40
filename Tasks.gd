extends Container

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
    var addTaskTimer = Timer.new()
    addTaskTimer.set_wait_time(1)
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
  var test_label = Label.new()
  test_label.set_text("Test")
  get_parent().add_child(test_label)
  print("Timeout hit")
