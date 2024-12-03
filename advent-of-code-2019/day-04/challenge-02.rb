# 750
range_start = 240920
range_stop = 789857

def decreases(numbers)
  seen = numbers[0]

  numbers.each do |number| # TODO checks [0] twice
    if number < seen
      return true
    end
    seen = number
  end

  return false
end

def repeating_adjacent(numbers)
  digits = numbers.join.to_s
  cons = false

  # remove all digits recurring more than twice in a row
  (0..9).each do |d|
    str = d.to_s
    digits.gsub!(/#{str}{3,}/, '')
  end

  # look for 2 repeating adjacent numbers in the remains
  digits.chars.map(&:to_i).each_cons(2) { |a,b| cons = true if a == b }

  return cons
end


possiblities = 0
(range_start..range_stop).each do |r|
  digits = r.to_s.chars.map(&:to_i)

  next if decreases(digits)

  next if !repeating_adjacent(digits)

  possiblities += 1
end

puts "Total of #{possiblities} possible passwords"
