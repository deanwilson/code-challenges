lines = File.open('input').readlines.map(&:chomp)

reports = lines.map { |l| l.split.map(&:to_i) }

safe = 0
reports.each do |report|
  directions = report.each_cons(2).map { |a,b| a <=> b }.uniq.count

  acceptable = []
  report.each_cons(2).each do |a,b|
    diff = (a - b).abs
    if diff.abs >= 1 && diff.abs <= 3
      acceptable << true
    else
      acceptable << false
    end
  end

  if directions == 1 && acceptable.all?
    safe += 1
  end
end

puts "Safe #{safe}" # 442
