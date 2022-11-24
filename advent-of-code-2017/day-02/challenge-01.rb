# 53978

rows = File.read('input').split("\n").map { |row| row.split.map(&:to_i).sort }

checksums = rows.map { |r| r[-1] - r[0] }

puts checksums.sum
