increases = 0
previous = 0

File.open('input').readlines.each do |measure|
  measure = measure.chomp.to_i

  # guard to ensure we have a previous value
  previous = measure if previous.zero?

  increases += 1 if measure > previous

  previous = measure
end

puts "Total depth increases #{increases}"
