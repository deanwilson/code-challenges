instructions = File.open('example').read.chomp
instructions = File.open('input').read.chomp

# TODO - capture the numbers on this pass and avoid the next step
valid_instructions = instructions.scan(/mul\(\d{1,3},\d{1,3}\)/).to_s

numbers = valid_instructions.scan(/(\d+),(\d+)/)

sum = numbers.map { |n| n[0].to_i * n[1].to_i }.sum

puts sum # 178538786
