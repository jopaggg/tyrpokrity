extends Control

# Узел AnimationPlayer для управления анимацией
@onready var animation_player: AnimationPlayer = $Button/AnimationPlayer


	# Подключаем сигналы mouse_entered и mouse_exited к обработчикам
  
func _on_button_mouse_entered() -> void:
	# Проверяем, что AnimationPlayer существует и имеет нужную анимацию
	if animation_player and animation_player.has_animation("hover_animation"):
		animation_player.play("hover_animation")
		print("Анимация 'hover_animation' запущена.")
	else:
		printerr("Ошибка: Анимация 'hover_animation' не найдена!")

func _on_button_mouse_exited() -> void:
	# Останавливаем анимацию при уходе курсора
	if animation_player and animation_player.has_animation("hover_animation"):
		animation_player.stop()
		print("Анимация 'hover_animation' остановлена.")
