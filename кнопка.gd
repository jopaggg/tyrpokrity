extends Control

# Ссылки на узлы
@onready var button = $Button
@onready var video = $VideoStreamPlayer
@onready var anim = $AnimationPlayer
@onready var label = $Label

# Имя библиотеки анимаций
var animation_library_name = "ButtonVideo.animations"

func _ready():
	# Проверяем, что все узлы существуют
	if button == null:
		printerr("Ошибка: Узел 'Button' не найден!")
	if video == null:
		printerr("Ошибка: Узел 'VideoStreamPlayer' не найден!")
	if anim == null:
		printerr("Ошибка: Узел 'AnimationPlayer' не найден!")
	if label == null:
		printerr("Ошибка: Узел 'Label' не найден!")

	# Загружаем библиотеку анимаций
	load_animation_library()

	# Останавливаем и скрываем видео
	video.play()  # Останавливаем воспроизведение видео
	video.visible = true  # Скрываем видео

	# Устанавливаем текст надписи
	label.text = "WATCH THE VIDEO"

	# Подключаем сигналы кнопки
 
func load_animation_library():
	# Путь к файлу библиотеки анимаций
	var animation_library_path = "res://сцены/ButtonVideo.animations.tres"
	
	# Загружаем библиотеку анимаций
	var library = load(animation_library_path)
	if library is AnimationLibrary:
		anim.add_animation_library(animation_library_name, library)
		print("Библиотека анимаций успешно загружена.")
	else:
		printerr("Ошибка: Не удалось загрузить библиотеку анимаций. Проверьте путь и тип файла.")

func _on_button_mouse_entered() -> void:
	# Запускаем анимацию при наведении курсора
	if anim.has_animation(animation_library_name + "/hover_in"):
		anim.play(animation_library_name + "/hover_in")
		print("Анимация 'hover_in' запущена.")
	else:
		printerr("Ошибка: Анимация 'hover_in' не найдена!")
	if video:
		video.visible = true
		video.play()
		print("Видео запущено.")

func _on_button_mouse_exited() -> void:
	# Запускаем анимацию при уходе курсора
	if anim.has_animation(animation_library_name + "/hover_out"):
		anim.play(animation_library_name + "/hover_out")
		print("Анимация 'hover_out' запущена.")
	else:
		printerr("Ошибка: Анимация 'hover_out' не найдена!")

func _on_button_pressed() -> void:
	# Запускаем анимацию при нажатии кнопки
	if anim.has_animation(animation_library_name + "/expand"):
		anim.play(animation_library_name + "/expand")
		print("Анимация 'expand' запущена.")
	else:
		printerr("Ошибка: Анимация 'expand' не найдена!")

	# Показываем и запускаем видео
	
