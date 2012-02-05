

require 'objects/player'

describe Player do
  before(:each) do
    
  end

  it "should find up-left bounds correctly" do
    pl = Player.new(nil, 0, nil, 0, 0)
    pl.x.should == 0
    pl.left
    pl.x.should == 0
    pl.up
    pl.y.should == 0    
  end
  
  it "should find bottom-right bounds correctly" do
    pl = Player.new(nil, 0, nil, 15, 15)
    pl.x.should == 15
    pl.right
    pl.x.should == 15
    pl.down
    pl.y.should == 15   
  end
  
   it "should move correctly" do
    pl = Player.new(nil, 0, nil, 5, 5)
    pl.right
    pl.right
    pl.down
    pl.down
    pl.up
    pl.up
    pl.left
    pl.left
    pl.x.should == 5
    pl.y.should == 5    
  end
  
end

