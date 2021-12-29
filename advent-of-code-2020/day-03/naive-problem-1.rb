
input = ARGV[0]
debug = ARGV[1] || false

right = 3
down = 1

grid = []
File.open(input).readlines.each do |line|
  line.chomp!
  fields = line.split('')
  grid << fields
end

require 'pp'

trees, x, y = 0, 0, 0


while y < grid.length
  puts "Y #{y} X #{x}" # is #{grid[y][x]}" if debug

  puts " = GRID X is row #{y} and #{grid[y].length} long"

  if grid[y][x] == '#'
    trees += 1
  end

  if (y + down < grid.length) && (x + right) > grid[y + down].length
#    puts " -- Not wide enough #{y} #{y + down} == #{grid[y + down]}"

    # horrible way to expand the map. Not memory friendly.
    grid[y + down].append grid[y + down].dup * x 
    grid[y + down].flatten!

    #puts " ++ Not wide enough #{y} #{y + down} == #{grid[y + down]}"
  end

  x += right
  y += down

end

puts "Encountered #{trees} trees"
