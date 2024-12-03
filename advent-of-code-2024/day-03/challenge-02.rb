instructions = File.open('example2').read.chomp
instructions = File.open('input').read.chomp

valid_instructions = instructions.scan(/mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)/)

total = 0
active = true

valid_instructions.each do |instruction|
  case instruction
  when "do()"
    active = true
  when "don't()"
    active = false
  when /mul/
    next unless active
    # puts " -- In active with #{instruction}" # DEBUG

    numbers = instruction.match(/(\d{1,3}),(\d{1,3})/)

    total += (numbers[1].to_i * numbers[2].to_i)
  else
    puts "Unrecognised instruction #{instruction}"
  end
end

puts "Total is #{total}" # 102467299
