presents = File.read('input').split.map { |m| m.chomp }

total_size = 0

presents.each do |present|
  length, width, height = present.split('x').map { |m| m.to_i }

  a, b = present.split('x').map { |m| m.to_i }.sort[0,2]

  ribbon = a + a + b + b # you need to wrap each of the sides twice - front and back
  bow = length * width * height

  total_size += ribbon + bow
end

puts total_size # 3812909
