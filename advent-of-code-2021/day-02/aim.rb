steps = File.readlines('input').map { |m| m.chomp }

aim = 0
depth = 0
position = 0

steps.each do |step|
  instruction, amount = step.split
  amount = amount.to_i

  case instruction
  when "forward"
    position += amount
    depth += (aim * amount)
  when "down"
    aim += amount
  when "up"
    aim -= amount
  else 
    fail "FAIL: unknown instruction: #{instruction}"
  end

end

puts "Position #{position} Depth #{depth} Multiplied #{position * depth}"
