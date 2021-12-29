frequencies = File.readlines('input').map {|f| f.chomp }
#frequencies = ["+7", "+7", "-2", "-7", "-4"]
#frequencies = %w[-6, +3, +8, +5, -6]

seen = Hash.new(0)
current_frequency = 0
found = false

while true do
  frequencies.each do |frequency|
    op, freq = frequency.scan(/[+-]|\d+/)
    freq = freq.to_i
    
    case op
    when '+'
        current_frequency += freq
    when '-'
      current_frequency -= freq
    else
      fail "Unexpected op: #{op}"
    end

    seen[current_frequency] += 1

    if seen[current_frequency] == 2
      found = true
      break
    end

  end
  
  break if found
end

puts "Final frequency is #{current_frequency}"