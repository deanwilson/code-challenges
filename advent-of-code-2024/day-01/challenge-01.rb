locations = File.open('input').readlines.map(&:chomp)
#locations = File.open('example').readlines.map(&:chomp)

left, right = [], []
total = 0

locations.each do |location|
  l, r = location.split.map { |m| m.chomp.to_i }

  left << l
  right << r
end


left.sort.zip(right.sort).each do |ids|
  total += (ids[0] - ids[1]).abs
end

puts total
