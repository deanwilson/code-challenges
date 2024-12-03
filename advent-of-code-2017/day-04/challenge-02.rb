# 265
valid = 0

File.read('input').split("\n").each do |passphrase|
  # sort the characters in each word so when compared anagrams are the same
  words = passphrase.split.map {|w| w.chars.sort.join }

  valid += 1 if words.length == words.uniq.length
end

puts "#{valid} passphrases"
