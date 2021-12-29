instructions = File.read('input').chomp

floor = 0
instructions.each_char.with_index do |c,i|
  next unless c == '(' or c == ')'

  if c == '('
    floor += 1
  else
    floor -= 1
  end

  if floor < 0
    puts "Entering basement at instruction #{i + 1}" # char index starts at 0
    break
  end
end
