extends Node2D


@export var number_scene: PackedScene

var grid_size = 10
var cell_size = grid_size + 50
var margin = 40


func _ready() -> void:
  for i in range(grid_size):
    var row = []
    for j in range(grid_size):
      var number = number_scene.instantiate()
      number.set_number(randi_range(1, 9))
      number.position = Vector2(j * cell_size + margin, i * cell_size + margin)
      call_deferred("add_child", number)
  
