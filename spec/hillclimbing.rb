require "#{File.dirname(__FILE__)}/../src/hillclimbing"
describe "HillClimbing" do

    it "should generate random genom" do
        hill = HillClimbing.new
        genom = hill.generate_genom 

        genom.size.should == 6 

        0..6.each do |row|
            genom[row].size.should == 6
            0..6.each do |column|
                [0, 1].should be_include genom[row][column]
            end
        end
    end

    it "should generate 100 random genoms" do
        hill = HillClimbing.new
        genoms = hill.generate_genoms 100
        genoms.size.should == 100
    end

    it "should generate 50 random genoms" do
        hill = HillClimbing.new
        genoms = hill.generate_genoms 50 
        genoms.size.should == 50
    end


end
