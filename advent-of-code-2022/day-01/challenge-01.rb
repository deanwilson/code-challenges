# 72240
records = File.open('input').read.split("\n\n")

totals = []
records.each do |record|
  totals << record.split.map(&:to_i).sum
end

carrier = totals.each_with_index.max[1]

puts "Highest amount of calories is #{totals[carrier]}"
