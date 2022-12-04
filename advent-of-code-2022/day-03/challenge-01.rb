# 7831

letters = ('a'..'z').to_a + ('A'..'Z').to_a
priorities = Hash[letters.zip((1..52))]

rucksacks = File.open('input').readlines.map(&:chomp)

total = 0
rucksacks.each do |rucksack|
  _, left, right = rucksack.partition(/.{#{rucksack.length / 2}}/) # breaks on odd number strings
  in_both = left.chars.to_a & right.chars.to_a

  total += priorities[in_both[0]]
end

puts total
