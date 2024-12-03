numbers = File.read('input').chomp.chars.map(&:to_i)

step = numbers.length / 2

total = 0

numbers.each_with_index do |num,idx|
  if idx + step + 1 > numbers.length
    restart = idx + step - numbers.length

    total += num if numbers[restart] == num
  else
    total += num if num == numbers[idx+step]
  end

end

puts total
