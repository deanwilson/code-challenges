# ucmifjae

messages = File.read('input').split("\n")

letters = [[],[],[],[],[],[],[],[]] # lazy hard coding

messages.each do |row|
  row.split("").each_with_index do |letter, index|
    letters[index] << letter
  end
end

message = []
letters.each do |row|
  letter = row.tally.min_by { |k,v| v }[0] # only change from challenge-01.rb
  message << letter
end

puts message.join
