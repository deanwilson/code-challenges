# 210957
records = File.open('input').read.split("\n\n")

totals = {}
records.each_with_index do |record, index|
  totals[index + 1] = record.split.map(&:to_i).sum
end

# whittle to the top 3 elves
highest_carriers = totals.sort_by {|k, v| v}.reverse[0..2].to_h

total_calories = highest_carriers.values.sum

puts "Top 3 carriers have a combined #{total_calories} calories"
