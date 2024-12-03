# 789844

def decreases(digits)
  numbers = digits.to_s.chars.map(&:to_i)
  
  seen = numbers[0]

  numbers.each do |number|
    puts number
    if number < seen
      puts "In if"
      return true
    end
    seen = number
  end

  return false
end

puts decreases(789844)
