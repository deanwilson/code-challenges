# 2683

letters = ('a'..'z').to_a + ('A'..'Z').to_a
priorities = Hash[letters.zip((1..52))]

rucksacks = File.open('input').readlines.map(&:chomp)

total = 0
rucksacks.each_slice(3) do |a,b,c|
  in_all = (a.chars.to_a & b.chars.to_a) & c.chars.to_a # & == intersection

  total += priorities[in_all[0]]
end

puts total
