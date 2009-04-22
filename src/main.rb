require "#{File.dirname(__FILE__)}/hillclimbing"

hill = HillClimbing.new
genom = hill.generate_genom 
puts Canvas.paint genom
max = 1000
memory = 100

res = hill.climb genom, max, memory

puts '======================' 
puts Canvas.paint res.genom
