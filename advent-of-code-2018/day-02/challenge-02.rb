box_ids = File.readlines('input').map {|f| f.chomp }
#box_ids = File.readlines('input-sample2').map {|f| f.chomp }

loop_count = 0
matched = String.new
difference = String.new

box_ids.product(box_ids).each do |x, y|
    loop_count += 1
    
    # create an array of arrays, each nested array being the same indexed letter from each
    # compare each nested array of letters and filter to only matches
    # the `.first` method removes the duplicated letter from each iteration
    matching = x.chars.zip(y.chars).select { |a, b| a == b }.map(&:first)

    # if our filter returns less than the input size we have a difference
    if matching.length == (x.length - 1)
        difference = x.chars.zip(y.chars).select { |a, b| a != b }.map(&:first)
        matched = matching.join
        break
    end
end

puts "Performed #{loop_count} iterations"
puts "Matched #{matched} == Difference #{difference}" # krdmtuqjgwfoevnaboxglzjph