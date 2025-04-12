#extends CanvasLayer
#
## Узлы управления
#@onready var create_orbit_button = $VBoxContainer/CreateOrbitButton
#@onready var add_satellite_button = $VBoxContainer/AddSatelliteButton
#
## Ссылка на основной узел
#var main_node: Node3D
#
#func _ready():
	## Подключение сигналов
	#create_orbit_button.connect("pressed", self, "_on_create_orbit_pressed")
	#add_satellite_button.connect("pressed", self, "_on_add_satellite_pressed")
#
	## Поиск основного узла
	#main_node = get_tree().root.get_node("Control") # Замените "Main" на имя узла вашей сцены
#
## Обработчик кнопки "Создать орбиту"
#func _on_create_orbit_pressed():
	#var popup = ConfirmationDialog.new()
	#popup.name = "CreateOrbitDialog"
	#add_child(popup)
#
	#popup.get_ok().connect("pressed", self, "_on_orbit_params_entered")
	#popup.add_child(create_orbit_form())
	#popup.popup_centered()
#
#func create_orbit_form() -> VBoxContainer:
	#var form = VBoxContainer.new()
#
	#var axis_label = Label.new()
	#axis_label.text = "Semi-Major Axis:"
	#form.add_child(axis_label)
#
	#var axis_input = LineEdit.new()
	#axis_input.name = "SemiMajorAxisInput"
	#form.add_child(axis_input)
#
	## Добавьте аналогичные поля для eccentricity, inclination и других параметров
	#return form
#
#func _on_orbit_params_entered():
	#var dialog = $CreateOrbitDialog
	#var semi_major_axis = dialog.get_node("SemiMajorAxisInput").text.to_float()
	#main_node.generate_orbit(semi_major_axis) # Передайте дополнительные параметры
#
## Обработчик кнопки "Добавить спутник"
#func _on_add_satellite_pressed():
	## Создать диалог или окно для выбора орбиты и добавления спутника
	#print("Добавление спутника")



#extends CanvasLayer
#
## Узлы управления
#@onready var create_orbit_button = $VBoxContainer/CreateOrbitButton
#@onready var add_satellite_button = $VBoxContainer/AddSatelliteButton
#
## Ссылка на основной узел
#var main_node: Node3D
#
#func _ready():
	## Подключение сигналов
	#create_orbit_button.connect("pressed", Callable(self, "_on_create_orbit_pressed"))
	#add_satellite_button.connect("pressed", Callable(self, "_on_add_satellite_pressed"))
#
	## Поиск основного узла
	#main_node = get_tree().root.get_node("EarthSystemOrbit") # Замените "Main" на имя узла вашей сцены
#
## Обработчик кнопки "Создать орбиту"
#func _on_create_orbit_pressed():
	#var popup = ConfirmationDialog.new()
	#popup.name = "CreateOrbitDialog"
	#add_child(popup)
#
	#popup.get_ok().connect("pressed", Callable(self, "_on_orbit_params_entered"))
	#popup.add_child(create_orbit_form())
	#popup.popup_centered()
#
#func create_orbit_form() -> VBoxContainer:
	#var form = VBoxContainer.new()
#
	#var axis_label = Label.new()
	#axis_label.text = "Semi-Major Axis:"
	#form.add_child(axis_label)
#
	#var axis_input = LineEdit.new()
	#axis_input.name = "SemiMajorAxisInput"
	#form.add_child(axis_input)
#
	## Добавьте аналогичные поля для eccentricity, inclination и других параметров
	#return form
#
#func _on_orbit_params_entered():
	#var dialog = $CreateOrbitDialog
	#var semi_major_axis = dialog.get_node("SemiMajorAxisInput").text.to_float()
	#main_node.generate_orbit(semi_major_axis) # Передайте дополнительные параметры
#
## Обработчик кнопки "Добавить спутник"
#func _on_add_satellite_pressed():
	## Создать диалог или окно для выбора орбиты и добавления спутника
	#print("Добавление спутника")
	
	
	
	
	
	
	
	
	
	
	
#extends CanvasLayer
#
## Ссылки на префабы орбиты и спутника
#@export var orbit_scene: PackedScene
#@export var satellite_scene: PackedScene
#
## Контейнер для орбит в 3D-сцене
#@onready var orbits_container: Node3D = $"/root/EarthSystemOrbit/Earth/OrbitsContainer"
#
## Элементы интерфейса
#@onready var semi_major_axis_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit
#@onready var eccentricity_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit2
#@onready var inclination_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit3
#@onready var argument_of_periapsis_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit4
#@onready var longitude_of_ascending_node_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit5
#@onready var orbits_list: ItemList = $VBoxContainer/OrbitsList
#
## Список созданных орбит
#var orbits: Array = []
#
#func _ready() -> void:
	## Подключаем кнопки
	#$VBoxContainer/AddOrbitButton.connect("pressed", Callable(self, "_on_add_orbit_pressed"))
	#$VBoxContainer/AddSatelliteButton.connect("pressed", Callable(self, "_on_add_satellite_pressed"))
#
## Обработчик нажатия кнопки "Добавить орбиту"
#func _on_add_orbit_pressed() -> void:
	## Получаем параметры орбиты из полей ввода
	#var semi_major_axis = float(semi_major_axis_input.text)
	#var eccentricity = float(eccentricity_input.text)
	#var inclination = float(inclination_input.text)
	#var argument_of_periapsis = float(argument_of_periapsis_input.text)
	#var longitude_of_ascending_node = float(longitude_of_ascending_node_input.text)
#
	## Создаем новую орбиту
	#var new_orbit = orbit_scene.instantiate()
	#orbits_container.add_child(new_orbit)
#
	## Устанавливаем параметры орбиты
	#new_orbit.semi_major_axis = semi_major_axis
	#new_orbit.eccentricity = eccentricity
	#new_orbit.inclination = inclination
	#new_orbit.argument_of_periapsis = argument_of_periapsis
	#new_orbit.longitude_of_ascending_node = longitude_of_ascending_node
#
	## Обновляем визуализацию орбиты
	#new_orbit.update_orbit()
#
	## Добавляем орбиту в список
	#orbits.append(new_orbit)
	#orbits_list.add_item("Орбита " + str(orbits.size()))
#
## Обработчик нажатия кнопки "Добавить спутник"
#func _on_add_satellite_pressed() -> void:
	#if orbits.is_empty():
		#return
#
	## Выбираем последнюю созданную орбиту
	#var target_orbit = orbits[-1]
#
	## Создаем новый спутник
	#var new_satellite = satellite_scene.instantiate()
	#target_orbit.add_child(new_satellite)
#
	## Устанавливаем параметры спутника
	#new_satellite.semi_major_axis = target_orbit.semi_major_axis
	#new_satellite.eccentricity = target_orbit.eccentricity
	#new_satellite.inclination = target_orbit.inclination
	#new_satellite.argument_of_periapsis = target_orbit.argument_of_periapsis
	#new_satellite.longitude_of_ascending_node = target_orbit.longitude_of_ascending_node
#
	## Обновляем положение спутника
	#new_satellite.update_orbit()







#extends CanvasLayer
#
### Узлы управления
#@onready var create_orbit_button = $VBoxContainer/AddOrbitButton
#@onready var add_satellite_button = $VBoxContainer/AddSatelliteButton
#
## Ссылка на основной узел
#var main_node: Node3D
#
#func _ready():
	## Подключение сигналов
	#create_orbit_button.connect("pressed", Callable(self, "_on_create_orbit_pressed"))
	#add_satellite_button.connect("pressed", Callable(self, "_on_add_satellite_pressed"))
	##$VBoxContainer/AddOrbitButton.connect("pressed", Callable(self, "_on_add_orbit_pressed"))
	##$VBoxContainer/AddSatelliteButton.connect("pressed", Callable(self, "_on_add_satellite_pressed"))
#
	## Поиск основного узла
	#main_node = get_tree().root.get_node("EarthSystemOrbit") # Замените "Main" на имя узла вашей сцены
#
## Обработчик кнопки "Создать орбиту"
#func _on_add_orbit_pressed():
	#var popup = ConfirmationDialog.new()
	#popup.name = "CreateOrbitDialog"
	#add_child(popup)
#
	#popup.get_ok().connect("pressed", self, "_on_orbit_params_entered")
	#popup.add_child(create_orbit_form())
	#popup.popup_centered()
#
#func create_orbit_form() -> VBoxContainer:
	#var form = VBoxContainer.new()
#
	#var axis_label = Label.new()
	#axis_label.text = "Semi-Major Axis:"
	#form.add_child(axis_label)
#
	#var axis_input = LineEdit.new()
	#axis_input.name = "SemiMajorAxisInput"
	#form.add_child(axis_input)
#
	## Добавьте аналогичные поля для eccentricity, inclination и других параметров
	#return form
#
#func _on_orbit_params_entered():
	#var dialog = $CreateOrbitDialog
	#var semi_major_axis = dialog.get_node("SemiMajorAxisInput").text.to_float()
	#main_node.generate_orbit(semi_major_axis) # Передайте дополнительные параметры
#
## Обработчик кнопки "Добавить спутник"
#func _on_add_satellite_pressed():
	## Создать диалог или окно для выбора орбиты и добавления спутника
	#print("Добавление спутника")



	
	
#extends CanvasLayer
#
## Ссылки на префабы орбиты и спутника
#@export var orbit_scene: PackedScene
#@export var satellite_scene: PackedScene
#
## Контейнер для орбит в 3D-сцене
#@onready var orbits_container: Node3D = $"/root/EarthSystemOrbit/Earth/OrbitsContainer"
#
## Элементы интерфейса
#@onready var semi_major_axis_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit
#@onready var eccentricity_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit2
#@onready var inclination_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit3
#@onready var argument_of_periapsis_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit4
#@onready var longitude_of_ascending_node_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit5
#@onready var orbits_list: ItemList = $VBoxContainer/OrbitsList
#
## Список созданных орбит
#var orbits: Array = []
#
#func _ready() -> void:
	## Подключаем кнопки
	#$VBoxContainer/AddOrbitButton.connect("pressed", Callable(self, "_on_add_orbit_pressed"))
	#$VBoxContainer/AddSatelliteButton.connect("pressed", Callable(self, "_on_add_satellite_pressed"))
#
## Обработчик нажатия кнопки "Добавить орбиту"
#func _on_add_orbit_pressed() -> void:
	## Получаем параметры орбиты из полей ввода
	#var semi_major_axis = float(semi_major_axis_input.text)
	#var eccentricity = float(eccentricity_input.text)
	#var inclination = float(inclination_input.text)
	#var argument_of_periapsis = float(argument_of_periapsis_input.text)
	#var longitude_of_ascending_node = float(longitude_of_ascending_node_input.text)
#
	## Создаем новую орбиту
	#var new_orbit = orbit_scene.instantiate()
	#orbits_container.add_child(new_orbit)
#
	## Устанавливаем параметры орбиты
	#new_orbit.semi_major_axis = semi_major_axis
	#new_orbit.eccentricity = eccentricity
	#new_orbit.inclination = inclination
	#new_orbit.argument_of_periapsis = argument_of_periapsis
	#new_orbit.longitude_of_ascending_node = longitude_of_ascending_node
#
	## Обновляем визуализацию орбиты
	#new_orbit.update_orbit()
#
	## Добавляем орбиту в список
	#orbits.append(new_orbit)
	#orbits_list.add_item("Орбита " + str(orbits.size()))
#
## Обработчик нажатия кнопки "Добавить спутник"
#func _on_add_satellite_pressed() -> void:
	#if orbits.is_empty():
		#return
#
	## Получаем выбранные орбиты из списка
	#var selected_orbits = orbits_list.get_selected_items()
	#if selected_orbits.size() == 0:
		#return# Если орбита не выбрана, ничего не делаем
#
	#var target_orbit = orbits[selected_orbits[0]]
#
	## Создаем новый спутник
	#var new_satellite = satellite_scene.instantiate()
	#target_orbit.add_child(new_satellite)
#
	## Устанавливаем параметры спутника
	#new_satellite.semi_major_axis = target_orbit.semi_major_axis
	#new_satellite.eccentricity = target_orbit.eccentricity
	#new_satellite.inclination = target_orbit.inclination
	#new_satellite.argument_of_periapsis = target_orbit.argument_of_periapsis
	#new_satellite.longitude_of_ascending_node = target_orbit.longitude_of_ascending_node
#
	## Обновляем положение спутника
	#new_satellite.update_position()

	
	
	
	
	
#extends CanvasLayer
#
## Ссылки на префабы орбиты и спутника
#@export var orbit_scene: PackedScene
#@export var satellite_scene: PackedScene
#
## Контейнер для орбит в 3D-сцене
#@onready var orbits_container: Node3D = $"/root/EarthSystemOrbit/Earth/OrbitsContainer"
#
## Элементы интерфейса
#@onready var semi_major_axis_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit
#@onready var eccentricity_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit2
#@onready var inclination_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit3
#@onready var argument_of_periapsis_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit4
#@onready var longitude_of_ascending_node_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit5
#@onready var orbits_list: ItemList = $VBoxContainer/OrbitsList
#
## Список созданных орбит
#var orbits: Array = []
#
#func _ready() -> void:
	## Подключаем кнопки
	#$VBoxContainer/AddOrbitButton.connect("pressed", Callable(self, "_on_add_orbit_pressed"))
	#$VBoxContainer/AddSatelliteButton.connect("pressed", Callable(self, "_on_add_satellite_pressed"))
#
## Обработчик нажатия кнопки "Добавить орбиту"
#func _on_add_orbit_pressed() -> void:
	## Получаем параметры орбиты из полей ввода
	#var semi_major_axis = float(semi_major_axis_input.text)
	#var eccentricity = float(eccentricity_input.text)
	#var inclination = float(inclination_input.text)
	#var argument_of_periapsis = float(argument_of_periapsis_input.text)
	#var longitude_of_ascending_node = float(longitude_of_ascending_node_input.text)
#
	## Создаем новую орбиту
	#var new_orbit = orbit_scene.instantiate()
	#orbits_container.add_child(new_orbit)
#
	## Устанавливаем параметры орбиты
	#new_orbit.semi_major_axis = semi_major_axis
	#new_orbit.eccentricity = eccentricity
	#new_orbit.inclination = inclination
	#new_orbit.argument_of_periapsis = argument_of_periapsis
	#new_orbit.longitude_of_ascending_node = longitude_of_ascending_node
#
	## Обновляем визуализацию орбиты
	#new_orbit.update_orbit()
#
	## Добавляем орбиту в список
	#orbits.append(new_orbit)
	#orbits_list.add_item("Орбита " + str(orbits.size()))
#
## Обработчик нажатия кнопки "Добавить спутник"
#func _on_add_satellite_pressed() -> void:
	#if orbits.is_empty():
		#return
#
	## Получаем выбранные орбиты из списка
	#var selected_orbits = orbits_list.get_selected_items()
	#if selected_orbits.size() == 0:
		#return# Если орбита не выбрана, ничего не делаем
#
	#var target_orbit = orbits[selected_orbits[0]]
#
	## Создаем новый спутник
	#var new_satellite = satellite_scene.instantiate()
	#target_orbit.add_child(new_satellite)
#
	## Получаем параметры орбиты
	#var orbital_params = {
		#"semi_major_axis": target_orbit.semi_major_axis,
		#"eccentricity": target_orbit.eccentricity,
		#"inclination": target_orbit.inclination,
		#"argument_of_periapsis": target_orbit.argument_of_periapsis,
		#"longitude_of_ascending_node": target_orbit.longitude_of_ascending_node
	#}
#
	## Инициализируем спутник с параметрами орбиты
	#new_satellite.initialize_satellite(orbital_params)
#
	## Обновляем положение спутника
	#new_satellite.update_satellite_position(0)
	
	
#extends CanvasLayer
#
## Ссылки на префабы орбиты и спутника
#@export var orbit_scene: PackedScene
#@export var satellite_scene: PackedScene
#
## Контейнер для орбит в 3D-сцене
#@onready var orbits_container: Node3D = $"/root/EarthSystemOrbit/Earth/OrbitsContainer"
#
## Элементы интерфейса
#@onready var semi_major_axis_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit
#@onready var eccentricity_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit2
#@onready var inclination_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit3
#@onready var argument_of_periapsis_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit4
#@onready var longitude_of_ascending_node_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit5
#@onready var orbits_list: ItemList = $VBoxContainer/OrbitsList
#
## Список созданных орбит
#var orbits: Array = []
#
#func _ready() -> void:
## Подключаем кнопки
	#$VBoxContainer/AddOrbitButton.connect("pressed", Callable(self, "_on_add_orbit_pressed"))
	#$VBoxContainer/AddSatelliteButton.connect("pressed", Callable(self, "_on_add_satellite_pressed"))
#
## Обработчик нажатия кнопки "Добавить орбиту"
#func _on_add_orbit_pressed() -> void:
## Получаем параметры орбиты из полей ввода
	#var semi_major_axis = float(semi_major_axis_input.text)
	#var eccentricity = float(eccentricity_input.text)
	#var inclination = float(inclination_input.text)
	#var argument_of_periapsis = float(argument_of_periapsis_input.text)
	#var longitude_of_ascending_node = float(longitude_of_ascending_node_input.text)
#
## Создаем новую орбиту
	#var new_orbit = orbit_scene.instantiate()
	#orbits_container.add_child(new_orbit)
#
#
## Устанавливаем параметры орбиты
	#new_orbit.semi_major_axis = semi_major_axis
	#new_orbit.eccentricity = eccentricity
	#new_orbit.inclination = inclination
	#new_orbit.argument_of_periapsis = argument_of_periapsis
	#new_orbit.longitude_of_ascending_node = longitude_of_ascending_node
#
## Обновляем визуализацию орбиты
	#new_orbit.update_orbit()
#
## Добавляем орбиту в список
	#orbits.append(new_orbit)
	#orbits_list.add_item("Орбита " + str(orbits.size()))
	#print(orbits.size)
	#var children = orbits_container.get_children() 
	#for child in children:
		#print(child.name)
#
## Обработчик нажатия кнопки "Добавить спутник"
#func _on_add_satellite_pressed() -> void:
	#if orbits.is_empty():
		#return
#
## Получаем выбранные орбиты из списка
	#var selected_orbits = orbits_list.get_selected_items()
	#if selected_orbits.size() == 0:
		#return# Если орбита не выбрана, ничего не делаем
#
	#var target_orbit = orbits[selected_orbits[0]]
#
## Создаем новый спутник
	#var new_satellite = satellite_scene.instantiate()
#
## Добавляем спутник как дочерний элемент выбранной орбиты
	#target_orbit.add_child(new_satellite)
#
## Устанавливаем параметры спутника
	#new_satellite.semi_major_axis = target_orbit.semi_major_axis
	#new_satellite.eccentricity = target_orbit.eccentricity
	#new_satellite.inclination = target_orbit.inclination
	#new_satellite.argument_of_periapsis = target_orbit.argument_of_periapsis
	#new_satellite.longitude_of_ascending_node = target_orbit.longitude_of_ascending_node
#
## Обновляем положение спутника
	#new_satellite.update_position()




extends CanvasLayer

# Ссылки на префабы орбиты и спутника
@export var orbit_scene: PackedScene
@export var satellite_scene: PackedScene

# Контейнер для орбит в 3D-сцене
@onready var orbits_container: Node3D = $"/root/EarthSystemOrbit/Earth/OrbitsContainer"

# Элементы интерфейса
@onready var semi_major_axis_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit
@onready var eccentricity_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit2
@onready var inclination_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit3
@onready var argument_of_periapsis_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit4
@onready var longitude_of_ascending_node_input: LineEdit = $VBoxContainer/VBoxContainer/LineEdit5
@onready var orbits_list: ItemList = $VBoxContainer/OrbitsList

# Список созданных орбит
var orbits: Array = []

func _ready() -> void:
	# Подключаем кнопки
	$VBoxContainer/AddOrbitButton.connect("pressed", Callable(self, "_on_add_orbit_pressed"))
	$VBoxContainer/AddSatelliteButton.connect("pressed", Callable(self, "_on_add_satellite_pressed"))

	$VBoxContainer/RemoveSatelliteButton.connect("pressed", Callable(self, "_on_remove_satellite_pressed"))
	$VBoxContainer/RemoveOrbitWithSatellitesButton.connect("pressed", Callable(self, "_on_remove_orbit_with_satellites_pressed"))

# Обработчик нажатия кнопки "Добавить орбиту"
func _on_add_orbit_pressed() -> void:
	# Получаем параметры орбиты из полей ввода
	var semi_major_axis = float(semi_major_axis_input.text)
	var eccentricity = float(eccentricity_input.text)
	var inclination = float(inclination_input.text)
	var argument_of_periapsis = float(argument_of_periapsis_input.text)
	var longitude_of_ascending_node = float(longitude_of_ascending_node_input.text)

	# Создаем новую орбиту
	var new_orbit = orbit_scene.instantiate()
	orbits_container.add_child(new_orbit)

	# Устанавливаем параметры орбиты
	new_orbit.semi_major_axis = semi_major_axis
	new_orbit.eccentricity = eccentricity
	new_orbit.inclination = inclination
	new_orbit.argument_of_periapsis = argument_of_periapsis
	new_orbit.longitude_of_ascending_node = longitude_of_ascending_node

	# Обновляем визуализацию орбиты
	new_orbit.update_orbit()

	# Добавляем орбиту в список
	orbits.append(new_orbit)
	orbits_list.add_item("Орбита " + str(orbits.size()))

# Обработчик нажатия кнопки "Добавить спутник"
func _on_add_satellite_pressed() -> void:
	if orbits.is_empty():
		return

	# Получаем выбранные орбиты из списка
	var selected_orbits = orbits_list.get_selected_items()
	if selected_orbits.size() == 0:
		return  # Если орбита не выбрана, ничего не делаем

	var target_orbit = orbits[selected_orbits[0]]

	# Создаем новый спутник
	var new_satellite = satellite_scene.instantiate()
	target_orbit.add_child(new_satellite)

	# Получаем параметры орбиты
	var orbital_params = {
		"semi_major_axis": target_orbit.semi_major_axis,
		"eccentricity": target_orbit.eccentricity,
		"inclination": target_orbit.inclination,
		"argument_of_periapsis": target_orbit.argument_of_periapsis,
		"longitude_of_ascending_node": target_orbit.longitude_of_ascending_node,
	}

	# Инициализируем спутник с параметрами орбиты
	new_satellite.initialize_satellite(orbital_params)

	# Обновляем положение спутника
	new_satellite.update_satellite_position(0)
	
	
	# Обработчик нажатия кнопки "Удалить спутник с орбиты"
func _on_remove_satellite_pressed() -> void:
	if orbits.is_empty():
		return

	# Получаем выбранные орбиты из списка
	var selected_orbits = orbits_list.get_selected_items()
	if selected_orbits.size() == 0:
		return  # Если орбита не выбрана, ничего не делаем

	var target_orbit = orbits[selected_orbits[0]]

	# Находим спутников, принадлежащих орбите, и удаляем их
	for child in target_orbit.get_children():
		if child is Node3D and child.has_method("update_satellite_position"):
			child.queue_free()  # Удаляем спутник


	
	# Обработчик нажатия кнопки "Удалить орбиту с её спутниками"
func _on_remove_orbit_with_satellites_pressed() -> void:
	if orbits.is_empty():
		return

	# Получаем выбранные орбиты из списка
	var selected_orbits = orbits_list.get_selected_items()
	if selected_orbits.size() == 0:
		return  # Если орбита не выбрана, ничего не делаем

	var target_orbit = orbits[selected_orbits[0]]

	# Удаляем все спутники, прикрепленные к орбите
	for child in target_orbit.get_children():
		if child is Node3D and child.has_method("update_satellite_position"):
			child.queue_free()  # Удаляем спутник

	# Удаляем орбиту
	target_orbit.queue_free()

	# Удаляем орбиту из списка
	orbits_list.remove_item(selected_orbits[0])
	orbits.remove_at(selected_orbits[0])
