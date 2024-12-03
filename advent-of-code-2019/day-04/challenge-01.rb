# 1154
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
  cons = false

  numbers.each_cons(2) { |a,b| cons = true if a == b }

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
