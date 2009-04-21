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


    it "should generate next generation canvas" do 
        pending 'need to fix cell switching first'
        canvas = Canvas.new '100000000000000000000000000000000000'
        canvas2 = canvas.live 

        canvas2.genom.should = '000000000000000000000000000000000000'
    end

    it 'should return number of neighbours of corner cell' do
        pending 'need to get cell on exect location'
        canvas = Canvas.new '010000-000000-000000-000000-000000-000000'
        canvas.neighbours(0,0).should = 1

    end

    it 'should return cell value' do
        canvas = Canvas.new '010000-000000-000000-000000-000000-000000'
        canvas.cell(0,0).should == 0
    end

    it 'should return cell value1' do
        canvas = Canvas.new '010000-000000-000000-000000-000000-000000'
        canvas.cell(0,1).should == 1
    end

    it 'should return cell value5' do
        canvas = Canvas.new '010000-000000-000005-000000-000000-000000'
        canvas.cell(2,5).should == 5
    end

    it 'should return cell value6' do
        canvas = Canvas.new '010000-000000-000005-000000-000000-000006'
        canvas.cell(5,5).should == 6
    end
end
