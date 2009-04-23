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
        #genom = [
                    #[0, 1, 1, 0, 0, 0], 
                    #[0, 0, 1, 0, 0, 0], 
                    #[1, 1, 1, 1, 1, 0], 
                    #[0, 0, 1, 0, 0, 0], 
                    #[0, 0, 1, 0, 0, 0], 
                    #[0, 0, 0, 0, 0, 0]]

    end

    def climb start, max_time, memory_limit
        time = 0
        new_fitness = 0
        fitness_loc = 1000000000
        fitness_glob = 1000000000
        t = []
        canvas = Canvas.new self.generate_genom
        while max_time > time do
            time += 1
            new_canvas = nil
            canvas.transformations.each do |transformation|
                current_fitness = transformation.fitness
                if (((!t.include? transformation) and (current_fitness < fitness_loc)) or (current_fitness < fitness_glob))
                    new_canvas = transformation
                    new_fitness = current_fitness
                end
            end
            if (time.modulo(100) ==0)
                puts '--------------------------'
                puts time
                puts Canvas.paint new_canvas.genom unless new_canvas.nil?
            end
            return solution if new_canvas.nil? 
            
            #puts new_fitness
            if new_fitness < fitness_glob
            #puts Canvas.paint new_canvas.genom
            #puts '--------------------------'
                fitness_glob = new_fitness
                solution = new_canvas
            end

            if t.size < memory_limit
                t.push canvas
            else
                t.push canvas
                t.slice(1, t.size-1)
            end
            canvas = new_canvas
        end

        return solution
    end
end

