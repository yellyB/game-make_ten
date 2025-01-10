extends Node2D


var number : int
var size: Vector2

func _ready() -> void:
  size = $Sprite2D.texture.get_size() * $Sprite2D.scale

func set_number(random_number: int):
  number = random_number
  $BoxContainer/Label.text = str(number)
