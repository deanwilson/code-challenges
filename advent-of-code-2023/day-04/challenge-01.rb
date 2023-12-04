games = File.open('input').readlines.map(&:chomp)

points = 0

games.each do |game|
  card, present, winning = game.split(/[:|]/)

  present = present.split.map(&:to_i)
  winning = winning.split.map(&:to_i)

  score   = 0
  winning.each do |win|
    if present.include? win
      if score == 0
        score = 1
      else
        score *= 2
      end
    end
  end

  points += score
end

puts "Total points: #{points}"
