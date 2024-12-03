# 383 
valid = 0

File.read('input').split("\n").each do |passphrase|
  words = passphrase.split

  valid += 1 if words.length == words.uniq.length
end

puts "#{valid} passphrases"
