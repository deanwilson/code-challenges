steps = File.readlines('input').map { |m| m.chomp }

depth = 0
position = 0

steps.each do |step|
  instruction, amount = step.split
  amount = amount.to_i

  case instruction
  when "forward"
    position += amount
  when "down"
    depth += amount
  when "up"
    depth -= amount
  else 
    puts "FAIL: unknown instruction: #{instruction}"
    exit
  end

end

puts "Position #{position} Depth #{depth} Multiplied #{position * depth}"
