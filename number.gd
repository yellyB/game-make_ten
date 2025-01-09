extends Node2D


var random_number : int

func set_number(number: int):
  random_number = number
  $BoxContainer/Label.text = str(number)
