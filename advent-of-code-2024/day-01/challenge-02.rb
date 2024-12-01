locations = File.open('input').readlines.map(&:chomp)
#locations = File.open('example').readlines.map(&:chomp)

left = []
right = Hash.new(0)

total = 0

locations.each do |location|
  l, r = location.split.map { |m| m.chomp.to_i }

  left << l
  right[r] += 1
end

left.each do |l|
  total += (l * right[l]) # multiply the number by the occurances
end

puts total
