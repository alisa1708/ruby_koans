# triangle.rb
def triangle(a, b, c)
  # Проверка на валидность треугольника
  sides = [a, b, c].sort
  unless sides[0] + sides[1] > sides[2]
    raise TriangleError, "Invalid triangle sides"
  end

  # Определение типа треугольника
  if a == b && b == c
    :equilateral
  elsif a == b || b == c || a == c
    :isosceles
  else
    :scalene
  end
end

# Класс для обработки ошибок невалидного треугольника
class TriangleError < StandardError
end