increases = 0

measures = File.read('input').split.map { |m| m.chomp.to_i }

measures.each_with_index do |measure, index|
  break if (index + 3) > measures.length # don't read incomplete windows

  current_sum = measures.slice(index..(index + 2)).sum
  future_sum = measures.slice((index + 1)..(index + 3)).sum

  increases += 1 if future_sum > current_sum
end

puts "Total depth increases #{increases}"
