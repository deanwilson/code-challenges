# VHJDDCWRD

## Initial state
stacks = [
  %w[F H B V R Q D P],
  %w[L D Z Q W V],
  %w[H L Z Q G R P C],
  %w[R D H F J V B],
  %w[Z W L C],
  %w[J R P N T G V M],
  %w[J R L V M B S],
  %w[D P J],
  %w[D C N W V],
]

commands = File.read('input').split("\n").reject {|l| !l.match(/move/)}

commands.each do |command|
  quantity, src, dest = command.split.values_at(1,3,5).map(&:to_i)

  src -= 1
  dest -= 1

  section = stacks[src].length - quantity
  extracted = stacks[src].slice!(section..stacks[src].length)

  stacks[dest] = stacks[dest] + extracted
end

## get message

stacks.each do |stack|
  puts stack[-1]
end

__END__

[P]     [C]         [M]
[D]     [P] [B]     [V] [S]
[Q] [V] [R] [V]     [G] [B]
[R] [W] [G] [J]     [T] [M]     [V]
[V] [Q] [Q] [F] [C] [N] [V]     [W]
[B] [Z] [Z] [H] [L] [P] [L] [J] [N]
[H] [D] [L] [D] [W] [R] [R] [P] [C]
[F] [L] [H] [R] [Z] [J] [J] [D] [D]
 1   2   3   4   5   6   7   8   9
