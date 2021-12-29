require 'digest'

secret_key = 'iwrupvqb'
iteration = 0

while true

  hashed = Digest::MD5.hexdigest secret_key + iteration.to_s

  # show a status to give an idea of how many iterations
  puts iteration if (iteration % 10000) == 0

  break if hashed =~ /^000000.+/

  iteration += 1
end

puts "Answer: hash created with #{iteration}" # 9958218
