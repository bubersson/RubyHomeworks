require 'pentomino'
require "piece"
require "desk"



describe Pentomino::Pentomino do
  before(:each) do
  end

  it "should find solution for 1x2" do
    pent = Pentomino::Pentomino.new(1,2)  
    pent.create_piece(%w(I 0:1))    
    pent.find_solution.should == true    
  end
  
  it "should find solution for 5x5" do
    pent = Pentomino::Pentomino.new(5,5)  
    pent.create_piece(%w(I 0:-1 0:-2 0:-3 0:-4))
    pent.create_piece(%w(L 0:-1 0:-2 0:-3 1:-3))
    pent.create_piece(%w(V 0:-1 0:-2 1:-2 2:-2))
    pent.create_piece(%w(T 1:0 2:0 1:-1 1:-2))
    pent.create_piece(%w(P 1:0 0:-1 1:-1 0:-2))
    pent.find_solution.should == true    
  end
  
  it "should find solution for 9x5" do
    pent = Pentomino::Pentomino.new(9,5)  
    pent.create_piece(%w(Z 1:0 1:-1 1:-2 2:-2))
    pent.create_piece(%w(Y -1:-1 0:-1 0:-2 0:-3))
    pent.create_piece(%w(X -1:-1 0:-1 1:-1 0:-2))
    pent.create_piece(%w(W 0:-1 1:-1 1:-2 2:-2))
    pent.create_piece(%w(P 1:0 0:-1 1:-1 0:-2))
    pent.create_piece(%w(U 2:0 0:-1 1:-1 2:-1))
    pent.create_piece(%w(N -1:-1 0:-1 -1:-2 -1:-3))
    pent.create_piece(%w(L 0:-1 0:-2 0:-3 1:-3))
    pent.create_piece(%w(V 0:-1 0:-2 1:-2 2:-2))
    pent.create_piece(%w(F 1:0 -1:-1 0:-1 0:-2))
    pent.create_piece(%w(T 1:0 2:0 1:-1 1:-2))
    pent.create_piece(%w(I 0:-1 0:-2 0:-3 0:-4))       
    pent.find_solution.should == true        
  end
  
  it "should find solution for 12x5" do
    pent = Pentomino::Pentomino.new(12,5)  
    pent.create_piece(%w(Z 1:0 1:-1 1:-2 2:-2))
    pent.create_piece(%w(Y -1:-1 0:-1 0:-2 0:-3))
    pent.create_piece(%w(X -1:-1 0:-1 1:-1 0:-2))
    pent.create_piece(%w(W 0:-1 1:-1 1:-2 2:-2))
    pent.create_piece(%w(P 1:0 0:-1 1:-1 0:-2))
    pent.create_piece(%w(U 2:0 0:-1 1:-1 2:-1))
    pent.create_piece(%w(N -1:-1 0:-1 -1:-2 -1:-3))
    pent.create_piece(%w(L 0:-1 0:-2 0:-3 1:-3))
    pent.create_piece(%w(V 0:-1 0:-2 1:-2 2:-2))
    pent.create_piece(%w(F 1:0 -1:-1 0:-1 0:-2))
    pent.create_piece(%w(T 1:0 2:0 1:-1 1:-2))
    pent.create_piece(%w(I 0:-1 0:-2 0:-3 0:-4))       
    pent.find_solution.should == true        
  end
  
  
  
  
  
  
  
end

