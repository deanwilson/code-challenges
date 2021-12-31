strings = File.readlines('input').map(&:chomp)

nice = 0
vowels = %w[a e i o u]

strings.each do |s|
  ## Bad strings
  next if s.match(/ab|cd|pq|xy/)

  ## 3 or more vowels
  vowel_count = s.split('').select { |s| vowels.include? s }.length
  next unless vowel_count >= 3

  ## recurring letter
  recurring = s.split('').each_cons(2).select { |a,b| a == b }.flatten.length
  next unless recurring > 0

  nice += 1
end

puts "Found #{nice} strings" # 236
