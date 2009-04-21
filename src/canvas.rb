class Canvas
    def initialize genom
        @genom = genom.gsub /-/,''
    end

    def genom 
        @genom
    end


    def live 
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
        index = row * 6 + column
        @genom[index].chr.to_i
    end

    def set_cell row, column, value
        index = row * 6 + column
        @genom[index] = value.to_s 
    end
end
