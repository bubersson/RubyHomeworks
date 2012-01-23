require 'pentomino'
require "piece"
require "desk"

describe Pentomino::Piece do
  before(:each) do
   
  end
  it "should create piece correctly" do
    piece = Pentomino::Piece.new("T",[[1,0],[2,0],[1,-1],[1,-2]])     
    piece.name.should == "T"
  end
  
  it "should compute bounds correctly" do
    piece = Pentomino::Piece.new("T",[[1,0],[2,0],[1,-1],[1,-2]])     
    piece.x_min.should == 0
    piece.y_min.should == -2
    piece.x_max.should == 2
    piece.y_max.should == 0
  end
  
  it "should normalize correctly" do
    piece = Pentomino::Piece.new("-",[[-2,0]])     
    piece.points.sort.should == [[0,0],[2,0]].sort     
  end
  
  
end

