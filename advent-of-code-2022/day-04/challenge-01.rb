# 518
assignments = File.read('input').split("\n").map { |row| row.split(',') }

def string2range(str)
  Range.new(*str.split("-").map(&:to_i)).to_a
end

redundant = 0
assignments.each do |assignment|
  first = string2range(assignment[0])
  second = string2range(assignment[1])

  if (first - second).empty? || (second - first).empty? 
    redundant += 1
  end
end

puts redundant
