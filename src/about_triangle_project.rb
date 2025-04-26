# triangle.rb
def triangle(a, b, c)
  # Проверка на недопустимые значения сторон
  sides = [a, b, c]
  if sides.any? { |side| side <= 0 }
    raise TriangleError, "Sides must be positive numbers"
  end

  # Проверка неравенства треугольника
  sides_sorted = sides.sort
  unless sides_sorted[0] + sides_sorted[1] > sides_sorted[2]
    raise TriangleError, "Invalid triangle sides"
  end

  # Определение типа треугольника
  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  else        :scalene
  end
end

class TriangleError < StandardError
end