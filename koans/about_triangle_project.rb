# triangle.rb
def triangle(a, b, c)
  # Проверка на числовые значения
  unless [a, b, c].all? { |side| side.is_a?(Numeric) }
    raise TriangleError, "Sides must be numbers"
  end

  # Проверка на положительные значения
  sides = [a, b, c].map(&:to_f)
  if sides.any? { |side| side <= 0 || side.infinite? || side.nan? }
    raise TriangleError, "Sides must be finite positive numbers"
  end

  # Проверка неравенства треугольника с учетом погрешности для Float
  sides_sorted = sides.sort
  unless sides_sorted[0] + sides_sorted[1] > sides_sorted[2] + Float::EPSILON
    raise TriangleError, "Invalid triangle sides"
  end

  # Определение типа треугольника с учетом погрешности для Float
  if (a - b).abs < Float::EPSILON && (b - c).abs < Float::EPSILON
    :equilateral
  elsif (a - b).abs < Float::EPSILON || (b - c).abs < Float::EPSILON || (a - c).abs < Float::EPSILON
    :isosceles
  else
    :scalene
  end
end

class TriangleError < StandardError
end