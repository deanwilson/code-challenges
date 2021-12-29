frequencies = File.readlines('input').map {|f| f.chomp }

current_frequency = 0

frequencies.each do |frequency|
  op, freq = frequency.scan(/[+-]|\d+/)
  
  case op
  when '+'
      current_frequency += freq.to_i
  when '-'
    current_frequency -= freq.to_i
  else
    fail "Unexpected op: #{op}"
  end
end

puts "Final frequency is #{current_frequency}"