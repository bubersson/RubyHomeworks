
require_relative "../lib/coverage"
require 'test/unit'

describe Coverage do  
  
  
  it "should find point on line" do
    line = Line.new("2","4")
    line.is_in?(2).should == true
    line.is_in?(3).should == true
    line.is_in?(4).should == true    
  end
  
  it "should find point outside line" do
    line = Line.new("2","4")
    line.is_in?(-2).should == false
    line.is_in?(1).should == false
    line.is_in?(7).should == false    
  end
  

  it "should find no solution (1)" do
    lines = []
    lines << Line.new("-1","0")
    lines << Line.new("-5","-3")
    lines << Line.new("2","5")
    t = Coverage.new(1, lines)
    result = t.solve
    result[0].should == "0"    
  end
  
  it "should find simple solution (2)" do
    lines = []
    lines << Line.new("-1","0")
    lines << Line.new("0","1")    
    t = Coverage.new(1, lines)
    result = t.solve
    result[0].should == "1"    
    result[1].should == "0 1"    
  end
  
  it "should find solution for long example (3)" do
    lines = []
    lines << Line.new("-2","5")
    lines << Line.new("-1","6")    
    lines << Line.new("3","7")    
    lines << Line.new("7","8")    
    lines << Line.new("8","10")    
    lines << Line.new("8","9")    
    t = Coverage.new(10, lines)
    result = t.solve
    result[0].should == "4"    
    result[1].should == "-1 6"    
    result[2].should == "3 7"    
    result[3].should == "7 8"    
    result[4].should == "8 10"    
  end
  
  it "should find no solution for a space (4)" do
    lines = []
    lines << Line.new("-2","5")
    lines << Line.new("-1","6")    
    lines << Line.new("3","7")        
    lines << Line.new("8","10")    
    lines << Line.new("8","9")    
    t = Coverage.new(10, lines)
    result = t.solve
    result[0].should == "0"        
  end
  
  it "should find no solution for no zero start (5)" do
    lines = []
    lines << Line.new("2","5")
    lines << Line.new("5","3")    
    lines << Line.new("2","3")        
    lines << Line.new("2","5")        
    t = Coverage.new(10, lines)
    result = t.solve
    result[0].should == "0"        
  end
  
  
  it "should find simple solution for two same lines (6)" do
    lines = []
    lines << Line.new("0","10")
    lines << Line.new("0","10")        
    t = Coverage.new(10, lines)
    result = t.solve
    result[0].should == "1"
    result[1].should == "0 10"
  end
  
  
  
  it "should find solution (7)" do
    lines = []
    lines << Line.new("0","2")
    lines << Line.new("2","4")
    lines << Line.new("4","6")
    lines << Line.new("6","8")            
    t = Coverage.new(6, lines)
    result = t.solve
    result[0].should == "3"
    result[1].should == "0 2"
    result[2].should == "2 4"
    result[3].should == "4 6"
  end
  
  
  
  
end

