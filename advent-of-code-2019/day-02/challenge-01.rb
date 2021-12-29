instructions = File.read('input').split(',').map { |m| m.chomp.to_i }

# Set the manual state as per AoC instructions
instructions[1] = 12
instructions[2] = 2


instructions.each_slice(4) do |ops|
  break if ops[0] == 99

  if ops[0] == 1
    instructions[ops[3]] = instructions[ops[1]] + instructions[ops[2]]
  elsif ops[0] == 2
    instructions[ops[3]] = instructions[ops[1]] * instructions[ops[2]]
  else
    fail "Unknown op code #{ops[0]}"
  end
end

puts "Position 0 == #{instructions[0]}" # 3306701
