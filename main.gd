extends Node2D


@export var number_scene: PackedScene
@onready var dragbox = $Dragbox

var grid_size = 10
var cell_size = 0
var number_nodes = []
var is_dragging = false
var drag_start_pos = Vector2.ZERO
var margin = 40


func _ready() -> void:
  dragbox.visible = false
  dragbox.z_index = 100
  var number_for_ref = number_scene.instantiate()
  number_for_ref._ready()
  cell_size = number_for_ref.size.x
  for i in range(grid_size):
    for j in range(grid_size):
      var number = number_scene.instantiate()
      #number.set_number(randi_range(1, 9))
      number.set_number(i * j)  # 디버그용 값
      number.position = Vector2(j * cell_size + margin, i * cell_size + margin)
      call_deferred("add_child", number)
      number_nodes.append(number)

  
func _input(event) -> void:
  if event is InputEventMouseButton:
    if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
      drag_start_pos = event.position
      is_dragging = true
      dragbox.visible = true
      dragbox.position = drag_start_pos
      dragbox.size = Vector2.ZERO
    elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
      is_dragging = false
      dragbox.visible = false
  elif event is InputEventMouseMotion and is_dragging:
    var drag_position = event.position
    var offsetValue = -12.5  # number 노드 중심이 0,0이므로 원이 들어있는 정확한 좌표가 아니기 때문에 보정.
    var grid_x = int((drag_position.x + offsetValue) / cell_size)
    var grid_y = int((drag_position.y + offsetValue) / cell_size)
    var rect_size = drag_position - drag_start_pos
    dragbox.size = rect_size.abs()
    dragbox.position = drag_start_pos + rect_size.min(Vector2.ZERO)  # 드래그 방향 반대일때 보정
    if grid_x >= 0 and grid_x < grid_size and grid_y >= 0 and grid_y < grid_size:
      var dragged_number = number_nodes[grid_y * grid_size + grid_x]
      print("Dragged over Number: ", dragged_number.number)
      
      
