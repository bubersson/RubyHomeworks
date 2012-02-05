require 'gosu'
require 'objects/grid'
require 'objects/block'
require 'objects/player'

describe Grid do
  before(:each) do
    Block.bootstrap(nil)
  end

  it "should count points on empty grid" do    
    grid = Grid.new(:columns => 16, :rows => 16)      
    grid.count_points.should == [0,0,0,0]
  end
  
  it "should count points on empty grid" do    
    grid = Grid.new(:columns => 16, :rows => 16)      
    pl = Player.new(nil, 0, nil, 1, 1)    
    grid.count_points.should == [0,0,0,0]
  end
  
  it "should check number of points" do    
    block = Block.new(nil,1,1)      
    block.over_max?(3, block.x, block.x, 15, 15).should == false    
    block.over_max?(4, block.x, block.y, 15, 15).should == true
  end
  
  
end

