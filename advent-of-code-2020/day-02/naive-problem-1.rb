require "ostruct"

def line2struct(line)
  s = OpenStruct.new

  fields = line.split

  allowed_range = fields[0].split('-')
  s.min_occurances, s.max_occurances = allowed_range[0].to_i, allowed_range[1].to_i,

  s.letter = fields[1].sub(':', '')
  s.password = fields[2]

  return s
end

passwords = File.open('input').read.split("\n")

valid = 0

passwords.each do |password|
  s = line2struct password

#  if s.password.match(/#{s.letter}{#{s.min_occurances},#{s.max_occurances}}/)
#    valid += 1
#  end

  occurances = s.password.count(s.letter)

  if occurances >= s.min_occurances && occurances <= s.max_occurances
    valid += 1
  end
end

puts "#{valid} valid passwords"
