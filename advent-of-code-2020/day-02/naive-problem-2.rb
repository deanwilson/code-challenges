require "ostruct"

def line2struct(line)
  s = OpenStruct.new

  fields = line.split

  allowed_range = fields[0].split('-')

  # the data set starts at 1, not 0, so remove one to make future operations easier
  s.min_occurances = allowed_range[0].to_i - 1
  s.max_occurances = allowed_range[1].to_i - 1

  s.letter = fields[1].sub(':', '')
  s.password = fields[2]

  return s
end

debug = false
passwords = File.open('input').read.split("\n")

valid = 0

passwords.each do |password|
  s = line2struct password

  puts "Matched #{s.letter} in #{s.password} -- #{s.min_occurances} #{s.max_occurances}" if debug
  if (s.password[s.min_occurances] == s.letter) ^ (s.password[s.max_occurances] == s.letter)
    puts "Valid #{s.letter} in #{s.password} -- #{s.min_occurances} #{s.max_occurances}" if debug
    valid += 1
  end
end

puts "#{valid} valid passwords"
