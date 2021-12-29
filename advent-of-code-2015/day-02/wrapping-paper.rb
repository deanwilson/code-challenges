presents = File.read('input').split.map { |m| m.chomp }

total_size = 0

presents.each do |present|
  length, width, height = present.split('x').map { |m| m.to_i }

  sides = [length * width, width * height, height * length]
  areas = sides.map { |s| 2 * s }

  smallest = sides.sort[0]

  area = areas.sum + smallest

  total_size += area
end

puts "Area is #{total_size}"
