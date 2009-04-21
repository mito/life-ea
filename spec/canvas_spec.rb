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

    it 'should return number of neighbours of left-upper corner cell' do
        canvas = Canvas.new '010000-000000-000000-000000-000000-000000'
        canvas.live_neighbours(0,0).should == 1

    end

    it 'should return number of neighbours of right-upper corner cell' do
        canvas = Canvas.new '010011-000011-000000-000000-000000-000000'
        canvas.live_neighbours(0,5).should == 3

    end

    it 'should return number of neighbours of middle cell' do
        canvas = Canvas.new '010011-000011-000000-000000-000000-000000'
        canvas.live_neighbours(2,2).should == 0

    end

    it 'should return number of neighbours of lower-left cell' do
        canvas = Canvas.new '010011-000011-000000-000000-100000-010000'
        canvas.live_neighbours(5,0).should == 2

    end

    it 'should return number of neighbours of lower-right cell' do
        canvas = Canvas.new '010011-000011-000000-000000-100011-010010'
        canvas.live_neighbours(5,5).should == 3

    end

    it 'should return number of neighbours of some cell' do
        canvas = Canvas.new '111011-111011-111000-000000-100011-010010'
        canvas.live_neighbours(1,1).should == 8

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
