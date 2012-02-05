require 'objects/score'

describe Score do
  before(:each) do
    
  end

  it "should find winner" do
    sc = Score.new(nil)
    sc.set_players([], [true,false,false,false])
    sc.update_score([1,0,0,0])    
    sc.check_winner.should == 0
  end
  
  it "should find no winner" do
    sc = Score.new(nil)
    sc.set_players([], [true,false,true,false])
    sc.update_score([2,0,2,0])    
    sc.check_winner.should == -1
  end
  
end

