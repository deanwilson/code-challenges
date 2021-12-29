module_masses = File.read('input').split.map { |m| m.chomp.to_i }
debug = false

def calc_mass(mass)
  mass /= 3
  mass -= 2
  mass
end

fuel_requirements = []

module_masses.each do |module_mass|
  adjustment = 0
  fuel_mass = 0

  # calcuate the module mass
  module_mass = calc_mass(module_mass)
 
  # now calcuate how much fuel the module needs
  fuel_mass = calc_mass(module_mass)
  module_mass += fuel_mass
    
  until calc_mass(fuel_mass) < 1
    adjustment = calc_mass(fuel_mass)
    puts "Adjustment #{adjustment}" if debug

    module_mass += adjustment # more fuel means more mass
    
    fuel_mass = adjustment # fuel mass left to calculate
  end

  fuel_requirements << module_mass
end

puts "Total fuel requirements #{fuel_requirements.sum}" # 4845049