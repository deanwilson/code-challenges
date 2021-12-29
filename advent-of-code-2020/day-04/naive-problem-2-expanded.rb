require 'pp'

ALLOWED_EYE_COLOUR = %w[amb blu brn gry grn hzl oth]

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

  unless ((passport.keys.length == 7) && (!passport.keys.include? 'cid')) || passport.keys.length == 8
    puts "Skipping in big unless keys == #{passport.keys.length} cid == #{passport.keys.include? 'cid'}"
    next
  end


  ## length checks
  %w[byr iyr eyr].each do |field|
    passport[field] = passport[field].to_i
    unless passport[field].to_s.length == 4
      puts "Skipping in length loop with #{passport[field]}"
      next
    end
  end

  unless ALLOWED_EYE_COLOUR.include? passport['ecl']
    puts "Skipping in eye colour with #{passport['ecl']}"
    next
  end

  unless passport['pid'].match(/^\d{9}$/)
    puts "Skipping in pid with #{passport['pid']}"
    next
  end

  puts "Validating in hcl with #{passport['hcl']}"
  unless passport['hcl'].match(/#[0-9a-f]{6}/)
    puts "Skipping in hcl with #{passport['hcl']}"
    next
  end

  unless passport['byr'] >= 1920 && passport['byr'] <= 2002
    puts "Skipping in byr with #{passport['byr']}"
    next
  end


  puts "Validating in iyr with #{passport['iyr']}"
  unless passport['iyr'] >= 2010 && passport['iyr'] <= 2020
    puts "Skipping in iyr with #{passport['iyr']}"
    next
  end

  puts "Validating in eyr with #{passport['eyr']}"
  unless passport['eyr'] >= 2020 && passport['eyr'] <= 2030
    puts "Skipping in eyr with #{passport['eyr']}"
    next
  end

  height, unit = passport['hgt'].scan(/(\d+)(..)/).flatten
  height = height.to_i

  puts "Validating in height start with #{passport['hgt']}"
  if unit == "cm"
    puts "Validating in height cm with #{passport['hgt']} #{height} #{unit}"
    unless height >= 150 && height <= 193
      puts "Skipping in height cm with #{passport['hgt']}"
      next
    end
  elsif unit == "in"
    puts "Validating in height in with #{passport['hgt']} #{height} #{unit}"
    unless height >= 59 && height <= 76
      puts "Skipping in height in with #{passport['hgt']}"
      next
    end
  else
    puts "Default: skipping height with #{passport['hgt']} #{height} #{unit}"
    next
  end

  puts "VALID!"

  valid += 1
end

puts "There are #{valid} valid passports"
