# 13221

## My notes
# Game states
# LOST = 0
# DRAW = 3
# WIN  = 6

# Piece Score
# "X": 1 # ROCK
# "Y": 2 # PAPER
# "Z": 3 # SCISSORS
#

# "If opponent has ?? and you have ???
scores = {
  "A"=> {    # Rock
    "X"=> 4,
    "Y"=> 8,
    "Z"=> 3,
  },
  "B"=> {    # Paper
    "X"=> 1,
    "Y"=> 5,
    "Z"=> 9,
  },
  "C"=> {     # Scissors
    "X"=> 7,
    "Y"=> 2,
    "Z"=> 6,
  }
}

total_score = 0

moves = File.open('input').readlines.map(&:split)

moves.each do |move|
  them, you = move

  puts "Looking up #{them} == #{you}"
  total_score += scores[them][you]
end

puts "Total score is #{total_score}"
