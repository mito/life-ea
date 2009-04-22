require "#{File.dirname(__FILE__)}/canvas"

class HillClimbing 
    def generate_genom
        genom = Array[[], [], [], [], [], []]
        6.times do |row|
            6.times do 
                rand = rand(2)
                genom[row] <<  rand
            end
        end
        genom
    end

    def climb start, max_time, memory_limit
        time = 0
        fitness_loc = 1000000000
        fitness_glob = 1000000000
        t = []
        canvas = Canvas.new self.generate_genom
        while max_time > time do
            time += 1
            new_canvas = nil
            canvas.transformations.each do |transformation|
                current_fitness = transformation.fitness
                if ((!t.include? transformation and current_fitness < fitness_loc) or current_fitness < fitness_glob) 
                    new_canvas = transformation
                end
            end
            
            #puts time
            return solution if new_canvas.nil?

            if new_canvas.fitness < fitness_glob
                fitness_glob = new_canvas.fitness
                solution = new_canvas
            end

            if t.size < memory_limit
                t.push canvas
            else
                t.push canvas
                t.slice(1, t.size-1)
            end
        end

        return solution
    end
end

