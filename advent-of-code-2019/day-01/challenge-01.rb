module_masses = File.read('input').split.map { |m| m.chomp.to_i }

fuel_requirements = []
module_masses.each do |module_mass|
  module_mass /= 3
  module_mass -= 2

  fuel_requirements << module_mass
end

puts "Total fuel requirements #{fuel_requirements.sum}" # 3231941