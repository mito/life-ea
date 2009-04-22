class Canvas
    def initialize genom
        @genom = genom
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
        0..6.times do |row|
            0..6.times do |column|
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

    def fitnes
        fitnes = 0
        fitnes += 30 if self.any_overheating?
        
        fitnes
    end

    def any_overheating? 
        0..6.times do |row|
            0..6.times do |column|
                live_neighbours = self.live_neighbours(row, column)
                return true if (live_neighbours > 3 and live_neighbours < 9)
            end
        end
        false
    end
end
