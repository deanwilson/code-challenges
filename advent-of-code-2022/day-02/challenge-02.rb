# 13131

## My notes
# Game states
# X == LOSE == 0
# Y == DRAW == 3
# Z == WIN  == 6

# Piece Score
# 1 # ROCK
# 2 # PAPER
# 3 # SCISSORS
#

# "If opponent has ?? and you have ???
scores = {
  "A"=> {    # Rock
    "X"=> 3,
    "Y"=> 4,
    "Z"=> 8,
  },
  "B"=> {    # Paper
    "X"=> 1,
    "Y"=> 5,
    "Z"=> 9,
  },
  "C"=> {     # Scissors
    "X"=> 2,
    "Y"=> 6,
    "Z"=> 7,
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
