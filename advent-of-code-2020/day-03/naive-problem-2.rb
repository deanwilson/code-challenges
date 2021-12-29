
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


def find_trees(grid, right, down)
  trees, x, y = 0, 0, 0

  while y < grid.length
    puts " = GRID row #{y} is X #{grid[y].length} long and is [#{grid[y][x]}]"
  
    if grid[y][x] == '#'
      trees += 1
    end
  
    if (y + down < grid.length) && (x + right) > grid[y + down].length
      # horrible way to expand the map. Not memory friendly.
      grid[y + down].append grid[y + down].dup * x 
      grid[y + down].flatten!
    end
  
    x += right
    y += down
  
  end

  trees
end

trees = [
  find_trees(grid, 1, 1),
  find_trees(grid, 3, 1),
  find_trees(grid, 5, 1),
  find_trees(grid, 7, 1),
  find_trees(grid, 1, 2),
]

multiplied = trees.reject(&:zero?).inject(:*)

puts "Encountered #{trees} trees"
puts "Encountered #{multiplied}"

# Encountered [59, 286, 76, 62, 45] trees
# Encountered 3577962960
