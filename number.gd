extends Node2D


var number : int

func set_number(random_number: int):
  number = random_number
  $BoxContainer/Label.text = str(number)
