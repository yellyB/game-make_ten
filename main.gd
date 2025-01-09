extends Node2D


@export var number_scene: PackedScene

var grid_size = 10
var cell_size = grid_size + 50



# Number 노드를 저장할 배열
var number_nodes = []

var is_dragging = false
var drag_start_pos = Vector2.ZERO

func _ready() -> void:
  for i in range(grid_size):
    var row = []
    for j in range(grid_size):
      var number = number_scene.instantiate()
      number.set_number(randi_range(1, 9))
      number.position = Vector2(j * cell_size, i * cell_size)
      call_deferred("add_child", number)
      number_nodes.append(number)

  
func _input(event) -> void:
  if event is InputEventMouseButton:
    if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
      drag_start_pos = event.position
      is_dragging = true
    elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
      is_dragging = false

  elif event is InputEventMouseMotion and is_dragging:
    var drag_position = event.position
    var grid_x = int((drag_position.x) / cell_size)
    var grid_y = int((drag_position.y) / cell_size)
    
    # 그리드 범위 내에 있을 때만
    if grid_x >= 0 and grid_x < grid_size and grid_y >= 0 and grid_y < grid_size:
      var dragged_number = number_nodes[grid_y * grid_size + grid_x]  # 해당 셀의 Number 노드 찾기
      print("Dragged over Number: ", dragged_number.random_number)  # 예시로 랜덤 숫자 출력
