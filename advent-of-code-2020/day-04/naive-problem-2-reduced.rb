ALLOWED_EYE_COLOUR = %w[amb blu brn gry grn hzl oth]

def split_passport(record)
  record.gsub!(/\n/, " ") # replace all new lines with a space

  record.split.map { |f| f.split(':') }.to_h
end

records = File.open('input').read.split("\n\n")
valid = 0

records.each do |record|
  passport = split_passport(record)

  unless ((passport.keys.length == 7) && (!passport.keys.include? 'cid')) || passport.keys.length == 8
    next
  end

  ## length checks
  %w[byr iyr eyr].each do |field|
    passport[field] = passport[field].to_i
    unless passport[field].to_s.length == 4
      next
    end
  end

  next unless ALLOWED_EYE_COLOUR.include? passport['ecl']

  next unless passport['pid'].match(/^\d{9}$/)

  next unless passport['hcl'].match(/#[0-9a-f]{6}/)

  next unless passport['byr'] >= 1920 && passport['byr'] <= 2002

  next unless passport['iyr'] >= 2010 && passport['iyr'] <= 2020

  next unless passport['eyr'] >= 2020 && passport['eyr'] <= 2030

  height, unit = passport['hgt'].scan(/(\d+)(..)/).flatten
  height = height.to_i

  if unit == "cm"
    next unless height >= 150 && height <= 193
  elsif unit == "in"
    next unless height >= 59 && height <= 76
  else
    next
  end

  valid += 1
end

puts "There are #{valid} valid passports"
