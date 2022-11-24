# qzedlxso

messages = File.read('input').split("\n")

letters = [[],[],[],[],[],[],[],[]] # lazy hard coding

messages.each do |row|
  row.split("").each_with_index do |letter, index|
    letters[index] << letter
  end
end

message = []
letters.each do |row|
  letter = row.tally.max_by { |k,v| v }[0]
  message << letter
end

puts message.join 
