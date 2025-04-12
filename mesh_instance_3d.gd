extends MeshInstance3D

# Параметры орбиты
@export var semi_major_axis: float = 10.0
@export var eccentricity: float = 0.1
@export var inclination: float = 0.0
@export var argument_of_periapsis: float = 0.0
@export var longitude_of_ascending_node: float = 0.0

# Ссылка на ImmediateMesh
@onready var orbit_mesh: ImmediateMesh = mesh

func _ready() -> void:
	update_orbit()

# Обновление визуализации орбиты
func update_orbit() -> void:
	orbit_mesh.clear_surfaces()  # Очищаем предыдущие данные

	# Начинаем создание новой поверхности
	orbit_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP)

	for i in range(100):
		var angle = 2 * PI * i / 100
		var radius = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(angle))
		var position_in_orbital_plane = Vector3(radius * cos(angle), 0, radius * sin(angle))

		var rotation_matrix = Basis().rotated(Vector3(1, 0, 0), inclination) * Basis().rotated(Vector3(0, 1, 0), argument_of_periapsis)
		var position = rotation_matrix * position_in_orbital_plane

		# Добавляем точку в линию
		orbit_mesh.surface_add_vertex(position)

	# Замыкаем орбиту (соединяем последнюю точку с первой)
	var first_point = orbit_mesh.surface_get_vertex(0)
	orbit_mesh.surface_add_vertex(first_point)

	# Завершаем создание поверхности
	orbit_mesh.surface_end()
