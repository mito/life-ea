class Canvas
    def initialize genom
        @genom = genom.gsub /-/,''
    end

    def genom 
        @genom
    end


    def live 
    end

    def neighbours row, column
     
    end

    def cell row, column
        index = row * 6 + column
        @genom[index].chr.to_i
    end
end
