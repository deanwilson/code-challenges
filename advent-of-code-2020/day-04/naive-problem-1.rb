def split_passport(record)
  # replace all new lines with a space
  record.gsub!(/\n/, " ")

  passport = record.split.map { |f| f.split(':') }.to_h

  passport
end

records = File.open('input').read.split("\n\n")
valid = 0

records.each do |record|
  passport = split_passport(record)

  if passport.keys.length == 8
    valid += 1
  end

  if (passport.keys.length == 7) && (!passport.keys.include? 'cid')
    valid += 1
  end
end

puts "There are #{valid} valid passports"
