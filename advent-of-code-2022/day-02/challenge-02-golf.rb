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

puts File.open('input').readlines.map(&:split).map { |t,y| scores[t][y] }.sum
