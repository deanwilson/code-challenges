box_ids = File.readlines('input').map {|f| f.chomp }
#box_ids = File.readlines('input-sample').map {|f| f.chomp }

double = 0
triple = 0

box_ids.each do |box_id|
    char_count = Hash.new(0)
    box_id.each_char do |char|
        char_count[char] += 1
    end

    # if the select isn't empty we a letter was present X times, so increment the counter
    double += 1 unless char_count.values.select { |c| c == 2}.empty?
    triple += 1 unless char_count.values.select { |c| c == 3}.empty?

end

# Double: 248 Triple 24 Checksum 5952
puts "Double: #{double} Triple #{triple} Checksum #{double * triple}"