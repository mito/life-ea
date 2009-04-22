class Canvas
    def initialize genom
        if genom[0].is_a? String 
            @genom = Array[[], [], [], [], [], []]
            6.times do |i|
                row = genom[i].split(//)
                row.map! do |s| 
                    s.to_i 
                end
                @genom[i] = row
            end
        else 
            @genom = genom
        end
    end

    def genom 
        @genom
    end

    #create copy of Canvas and modify cells
    def next_generation 
        canvas = self.clone
        
    end

    def transformed_genom
        new_gen = Array[[], [], [], [], [], []]
        6.times do |row|
            6.times do |column|
                live_neighbours = self.live_neighbours(row, column)
                new_cell = case live_neighbours
                    when 0..1 then 0
                    when 4..8 then 0
                    when 2 then self.cell(row, column)
                    when 3 then 1
                end
                new_gen[row] << new_cell
            end
        end
        new_gen
    end

    def live_neighbours row, column
        row_neighbours = case row
            when 0 then [0, 1]
            when 1..4 then [-1, 0, 1]
            when 5 then [-1, 0]
        end

        column_neighbours = case column 
            when 0 then [0, 1]
            when 1..4 then [-1, 0, 1]
            when 5 then [-1, 0]
        end

        alive = 0;
        row_neighbours.each do |row_n|
            column_neighbours.each do |column_n|
                if row_n != 0 or column_n != 0
                    alive += self.cell(row + row_n, column + column_n)
                end
            end
        end

        alive
    end

    def cell row, column
        @genom[row][column]
    end

    def set_cell row, column, value
        @genom[row][column] = value
    end

    def fitness
        fitness = 0
        fitness += 36 unless self.any_overheating?
        fitness += self.live_cells
        canvas2 = Canvas.new self.transformed_genom
        fitness += canvas2.live_cells * 2
        
        fitness
    end

    def any_overheating? 
        6.times do |row|
            6.times do |column|
                live_neighbours = self.live_neighbours(row, column)
                if (live_neighbours > 3)
                    return true 
                end
            end
        end
        false
    end

    def live_cells 
        count = 0
        6.times do |row|
            6.times do |column|
                count += 1 if 1 == self.cell(row, column)
            end
        end
        return count
    end

    def transformations  
        transformations = []
        5.downto(0) do |row|
            5.downto(0) do |column|
                genom = Canvas.clone self.genom
                value = self.cell(row, column) == 0 ? 1 : 0
                genom[row][ column] = value 
                transformations.push Canvas.new genom
            end
        end
        transformations
    end

    def self.clone genom
        new_genom = genom.clone
        6.times do |i|
            new_genom[i] = genom[i].clone
        end
        new_genom
    end

    def == other 
        self.genom == other.genom
    end

    def self.paint genom
        string = ''
        6.times do |row|
            6.times do |column|
                string += genom[row][column].to_s
            end
            string += "\n"
        end
        
        string
    end

end
