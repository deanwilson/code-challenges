require 'digest'

secret_key = 'iwrupvqb'
iteration = 0

while true

  hashed = Digest::MD5.hexdigest secret_key + iteration.to_s
  puts "Hashed is #{hashed}"

  break if hashed =~ /^00000.+/

  iteration += 1
end

puts "Answer: hash created with #{iteration}" # 346386
