# triangle.rb
def triangle(a, b, c)
  sides = [a, b, c].sort
  
  # Проверка на неположительные стороны
  if sides.any? { |side| side <= 0 }
    raise TriangleError, "Sides must be positive numbers"
  end
  
  # Проверка неравенства треугольника
  unless sides[0] + sides[1] > sides[2]
    raise TriangleError, "Does not satisfy triangle inequality"
  end
  
  # Определение типа треугольника
  if sides.uniq.size == 1
    :equilateral
  elsif sides.uniq.size == 2
    :isosceles
  else
    :scalene
  end
end

class TriangleError < StandardError
end