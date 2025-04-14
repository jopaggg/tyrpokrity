shader_type canvas_item;

void fragment() {
    vec2 uv = UV - vec2(0.5); // Переносим координаты в центр.
    float dist = length(uv);  // Вычисляем расстояние до центра.
    
    // Создаем маску для круга с мягкими краями
    float radius = 0.5;       // Радиус круга.
    float edge_softness = 0.05; // Ширина размытия краев.
    float alpha = smoothstep(radius, radius - edge_softness, dist);
    
    // Применяем текстуру и устанавливаем прозрачность
    COLOR = texture(TEXTURE, UV);
    COLOR.a *= alpha;         // Умножаем альфа-канал на маску.
}