instructions = File.read('input').chomp

floor = 0
instructions.each_char do |c|
  next unless c == '(' or c == ')'

  if c == '('
    floor += 1
  else
    floor -= 1
  end
end

puts "Floor #{floor}"
