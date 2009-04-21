require "#{File.dirname(__FILE__)}/../src/canvas"
describe "Canvas" do

    it "should be initialized by human readable string" do
        canvas = Canvas.new '000000-000000-000000-000000-000000-000000'
        canvas.genom.should == '000000000000000000000000000000000000' 
    end

    it "should be initialized by binary string" do
        canvas = Canvas.new '111111111111111111111111111111111111'
        canvas.genom.should == '111111111111111111111111111111111111' 
    end
end
