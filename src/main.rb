require "#{File.dirname(__FILE__)}/hillclimbing"

time = Time.now
hill = HillClimbing.new
genom = hill.generate_genom 
puts Canvas.paint genom
max = 10000
memory = 10

res = hill.climb genom, max, memory

puts '======================' 
puts Canvas.paint res.genom
puts (Time.now - time).to_s
