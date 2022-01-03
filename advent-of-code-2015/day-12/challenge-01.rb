json = File.read('input').chomp

total = 0

json.gsub(/(-?\d+)/) do |number|
  number = number.to_i

  if number.to_s.start_with? '-'
    total -= number.abs
  else
    total += number
  end
end

puts "Total is #{total}" # 156366
