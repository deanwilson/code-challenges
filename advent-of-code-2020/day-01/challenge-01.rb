expenses = File.open('input').readlines.map { |e| e.chomp.to_i }

sum = 0
expenses.permutation(2) do |a,b|
  if a + b == 2020
    sum = a * b
  end
end

puts "Sum is #{sum}" # 440979
