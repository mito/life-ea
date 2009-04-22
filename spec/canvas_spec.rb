require "#{File.dirname(__FILE__)}/../src/canvas"
describe "Canvas" do

    it "should be initialized by matrix" do
        genom = [[1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]]
        canvas = Canvas.new genom
        canvas.genom.should == genom
    end

    it "should be initialized by human readable string" do
        genom = ['111111', '111111', '111111', '111111', '111111', '111111']
        canvas = Canvas.new genom
        genom = [[1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]]
        canvas.genom.should == genom
    end

    it "should return transformed genom" do 
        genom = [[0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        exp_genom = [[0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]]
        canvas.transformed_genom.should == exp_genom 
    end

    it "should return transformed genom2" do 
        genom = [[0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        genom = [[0, 0, 1, 0, 0, 0], [0, 0, 1, 0, 0, 0], [0, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]]
        canvas.transformed_genom.should == genom
    end

    it 'should return number of neighbours of left-upper corner cell' do
        genom = [[0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        canvas.live_neighbours(0,0).should == 1
    end

    it 'should return number of neighbours of right-upper corner cell' do
        genom = [[0, 1, 0, 0, 1, 1], [0, 0, 0, 0, 1, 1], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        canvas.live_neighbours(0,5).should == 3
    end

    it 'should return number of neighbours of middle cell' do
        genom = [[0, 1, 0, 0, 1, 1], [0, 0, 0, 0, 1, 1], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        canvas.live_neighbours(2,2).should == 0
    end

    it 'should return number of neighbours of lower-left cell' do
        genom = [[0, 1, 0, 0, 1, 1], [0, 0, 0, 0, 1, 1], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0], [0, 1, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        canvas.live_neighbours(5,0).should == 2
    end

    it 'should return number of neighbours of lower-right cell' do
        genom = [[0, 1, 0, 0, 1, 1], [0, 0, 0, 0, 1, 1], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 1, 1], [0, 1, 0, 0, 1, 0]]
        canvas = Canvas.new genom
        canvas.live_neighbours(5,5).should == 3
    end

    it 'should return number of neighbours of some cell' do
        genom = [[1, 1, 1, 0, 1, 1], [1, 1, 1, 0, 1, 1], [1, 1, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 1, 1], [0, 1, 0, 0, 1, 0]]
        canvas = Canvas.new genom
        canvas.live_neighbours(1,1).should == 8
    end

    it 'should return cell value' do
        genom = [[0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        canvas.cell(0,0).should == 0
    end

    it 'should return cell value1' do
        genom = [[0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        canvas.cell(0,1).should == 1
    end

    it 'should return cell value5' do
        genom = [[0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 5], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        canvas.cell(2,5).should == 5
    end

    it 'should return cell value6' do
        genom = [[0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 5], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 6]]
        canvas = Canvas.new genom
        canvas.cell(5,5).should == 6
    end

    it 'should set cell value to 5,5' do
        genom = [[0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 5], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 6]]
        canvas = Canvas.new genom
        canvas.set_cell(5,5,11)
        canvas.genom.should == [[0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 5], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 11]]
    end
    it 'should set cell value to 0,5' do
        genom = [[0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 5], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 6]]
        canvas = Canvas.new genom
        canvas.set_cell(0,5,1)

        exp_genom = [[0, 1, 0, 0, 0, 1], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 5], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 6]]
        canvas.genom.should ==  exp_genom
    end

    it "should add 30 points to fitnes if there are no everheating cells" do
        genom = [
                    [0, 1, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        canvas.fitnes.should == 30
    end

    it "should add 1 point for every left cell" do
        genom = [
                    '001100',
                    '011110',
                    '011110',
                    '001100',
                    '000000',
                    '000000']
        canvas = Canvas.new genom
        canvas.fitnes.should == 4 
    end

    it 'should find out if there are any overheating cells' do
        genom = [
                    [0, 1, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        canvas.any_overheating?.should == false 
    end

    it 'should find out if there are any overheating cells' do
        genom = [
                    [1, 1, 0, 0, 0, 0], 
                    [1, 1, 1, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0], 
                    [0, 0, 0, 0, 0, 0]]
        canvas = Canvas.new genom
        canvas.any_overheating?.should == true 
    end

    it 'should return count of live cells' do 
        genom = [
                    '001100',
                    '011110',
                    '011110',
                    '001100',
                    '000000',
                    '000000']
        canvas = Canvas.new genom
        canvas.live_cells.should == 12 
    end
end
