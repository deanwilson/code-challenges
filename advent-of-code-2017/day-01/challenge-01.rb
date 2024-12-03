numbers = File.read('input').chomp.chars.map(&:to_i)

numbers << numbers[0] # no cleverness with rotation, add last int at the end

puts numbers.each_with_index.collect { |e,i| e == numbers[i+1] ? e : 0 }.sum
