

require_relative "../lib/coverage"
require 'test/unit'

describe Coverage do  

  it "should sum area of two squares with same size" do
    lines = []
    lines << Line.new(a[0],a[1])
    t = Test.new(2, lines)
    t.solve()
    a.sum_area(b).should == 7    
  end
  
  it "should sum area of two squares with same size" do
    a = Square.new(4,0,0)
    b =  Square.new(2,0,2)    
    a.sum_area(b).should == 18
  end
  
  it "should sum area of two squares with same size" do
    a = Square.new(4,0,0)
    b =  Square.new(2,2,2)    
    a.sum_area(b).should == 19
  end
  
  it "should sum area of two squares with same size" do
    a = Square.new(1,0,0)
    b =  Square.new(3,1,2)    
    a.sum_area(b).should == 10    
  end
  
  it "should sum area of two squares with same size" do
    a = Square.new(2,-1,0)
    b =  Square.new(3,1,4)    
    a.sum_area(b).should == -1
  end
  
  
end

