# To change this template, choose Tools | Templates
# and open the template in the editor.


require_relative "../lib/squares"
require 'test/unit'

describe Square do  

  
  # Tests of computation correctness
  it "should sum area of two squares with same 1point corner" do
    a = Square.new(2,0,0)
    b =  Square.new(2,1,1)    
    a.sum_area(b).should == 7    
  end
  
  it "should sum area of two squares with different size" do
    a = Square.new(4,0,0)
    b =  Square.new(2,0,2)    
    a.sum_area(b).should == 18
  end
  
  it "should sum area of two squares with different size, two axes changed" do
    a = Square.new(4,0,0)
    b =  Square.new(2,2,2)    
    a.sum_area(b).should == 19
  end
  
  it "should sum area of two squares with different size, move from zero" do
    a = Square.new(1,0,0)
    b =  Square.new(3,1,2)    
    a.sum_area(b).should == 10    
  end
  
  it "should sum area of two squares with different size, not colliding" do
    a = Square.new(2,-1,0)
    b =  Square.new(3,1,4)    
    a.sum_area(b).should == -1
  end
  
  
end

