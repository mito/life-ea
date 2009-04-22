require "#{File.dirname(__FILE__)}/../src/hillclimbing"
require "#{File.dirname(__FILE__)}/../src/canvas"
describe "HillClimbing" do

    it "should generate random genom" do
        hill = HillClimbing.new
        genom = hill.generate_genom 

        genom.size.should == 6 

        0..6.times do |row|
            genom[row].size.should == 6
            0..6.times do |column|
                [0, 1].should be_include genom[row][column]
            end
        end
    end
    
    it "should hillclimb" do
        #pending 'comparing canvases'
        hill = HillClimbing.new
        genom = hill.generate_genom 
        max = 10
        memory = 10

        res = hill.climb genom, max, memory
        res.should be_kind_of Canvas 
    end
end
