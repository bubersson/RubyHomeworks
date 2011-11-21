require_relative "../lib/tennis_scorer"
require 'test/unit'
describe "TennisScorer", "basic scoring" do
  it "should start with a score of 0-0" do
    ts = TennisScorer.new
    ts.score.should == "0-0"
  end
  it "should be 15-0 if the server wins a point" do    
    ts = TennisScorer.new
    ts.win("a")
    ts.score.should == "15-0"
  end
  it "should be 0-15 if the receiver wins a point"do
    ts = TennisScorer.new
    ts.win("b")
    ts.score.should == "0-15"
  end
  it "should be WIN a after one user wins 4 times"  do
    ts = TennisScorer.new
    ts.win("a")
    ts.win("a")
    ts.win("a")
    ts.win("a")
    ts.score.should == "WIN a"
  end
   it "should be 40-A after receiver wins after 40-40 "  do
    ts = TennisScorer.new
    ts.win("a") # 15-0
    ts.win("a") # 30-0
    ts.win("a") # 40-0
    ts.win("b") # 40-15
    ts.win("b") # 40-30
    ts.win("b") # 40-40
    ts.win("b") # 40-A
    ts.win("a") # 40-40
    ts.win("b") # 40-A
    ts.score.should == "40-A"
  end
  it "should be WIN a after one user wins 4 times"  do
    ts = TennisScorer.new
    ts.win("a") # 15-0
    ts.win("a") # 30-0
    ts.win("a") # 40-0
    ts.win("b") # 40-15
    ts.win("b") # 40-30
    ts.win("b") # 40-40
    ts.win("a") # A-40
    ts.win("a") # W-40 > Win a
    ts.score.should == "WIN a"
  end
  
end

