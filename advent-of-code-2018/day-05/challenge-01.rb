polymer = File.read('input2').chomp.chars

def matched_pair?(a, b)
  # FAIL: this could have been a call to swapcase if I'd remembered it existed
  pair = false

  if a.upcase == a
    # left side is upper case so look for a lower case
    if a.downcase == b
        pair = true
    end
  else # left side is lower case so look for upper case
    if a.upcase == b
        pair = true
    end
  end

  return pair
end

while true
  current_length = polymer.length
  
  polymer.each_index do |idx|
    if matched_pair?(polymer[idx], polymer[idx + 1])
      # remove both matched elements
      polymer.slice!(idx..(idx +1))

      # start the iteration again. could optimise to back track one index and continue
      break
    end
  end
  
  break if polymer.length == current_length
end

puts "Final Length #{polymer.length}" # 11946