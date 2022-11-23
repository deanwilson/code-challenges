# Should be 1050

triangles = File.read('input').split("\n").map { |triangle| triangle.split.map(&:to_i).sort }

valid = 0

triangles.each do |sides|
  if sides[0] + sides[1] > sides[2]
    valid += 1
  end
end

puts "Valid triangles #{valid}"
