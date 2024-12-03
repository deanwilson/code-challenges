expenses = File.open('input').readlines.map { |e| e.chomp.to_i }

sum = 0
expenses.permutation(3) do |a,b,c|

  if a + b + c == 2020
    sum = a * b * c
  end
end

puts "Sum is #{sum}" # 82498112
