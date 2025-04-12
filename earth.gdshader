shader_type spatial;

// Текстуры
uniform sampler2D day_texture;  // Дневная текстура
uniform sampler2D night_texture;  // Ночная текстура
uniform sampler2D normal_map;  // Карта нормалей

// Направление на Солнце
uniform vec3 sun_direction;

void fragment() {
    // Нормаль из карты нормалей
    vec3 normal_map_value = texture(normal_map, UV).rgb;
    vec3 normal = normalize(normal_map_value * 2.0 - 1.0);  // Преобразуем из [0, 1] в [-1, 1]

    // Угол между нормалью и направлением на Солнце
    float sun_angle = dot(normal, sun_direction);

    // Плавный переход между дневной и ночной текстурой
    float blend_factor = smoothstep(0, 1, sun_angle);

    // Смешиваем текстуры
    vec4 day_color = texture(day_texture, UV);
    vec4 night_color = texture(night_texture, UV);
    ALBEDO = mix(night_color.rgb, day_color.rgb, blend_factor);

    // Применяем нормаль
    NORMAL = normal;
}