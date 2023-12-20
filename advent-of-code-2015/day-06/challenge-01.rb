# remove all the 'turns' so instructions become operation range through range
instructions = File.read('input').gsub(/turn /, '').split(/\n/)

lights = Array.new(1000) {Array.new(1000)}

instructions.each do |instruction|
  op, start_row, start_column, through, end_row, end_column = instruction.to_s.split(/[ ,]/)

  start_row = start_row.to_i
  start_column = start_column.to_i

  end_row = end_row.to_i
  end_column = end_column.to_i

  case op
  when 'on'
    for row in start_row..end_row do
      for column in start_column..end_column do
        lights[row][column] = 1
      end
    end
  when 'off'
    for row in start_row..end_row do
      for column in start_column..end_column do
        lights[row][column] = 0
      end
    end
  when 'toggle'
    for row in start_row..end_row do
      for column in start_column..end_column do
        lights[row][column] = lights[row][column] == 1 ? 0 : 1
      end
    end
  end
end

puts "#{lights.flatten.select { |l| l == 1 }.count} lights are lit"

# 543903
