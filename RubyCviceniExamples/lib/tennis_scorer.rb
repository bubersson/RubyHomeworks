class TennisScorer
  attr_accessor :score 
  def initialize()
    @score="0-0"
    @game_a = 0
    @game_b = 0
  end
  
  def win(s)
    if (s=="a")      # 2 2 = 30 30
      if @game_a > 2 and @game_b > 2        
        @game_a += 1 
        @game_b = 3
      else
        @game_a += 1 
      end
    else
      if @game_a > 2 and @game_b > 2        
        @game_b += 1 
        @game_a = 3
      else
        @game_b += 1 
      end      
    end
    if res = check_winner() 
      @score = "WIN "+res
    else      
      @score = score_string(@game_a)+"-"+score_string(@game_b)
    end
  end
  
  def score_string(sc)
    case sc
    when 0
      return "0"
    when 1
      return "15"
    when 2
      return "30"
    when 3
      return "40"
    when 4
      return "A"      
    end
  end
  
  def check_winner
    if (@game_a > 3 and @game_b < 3) or (@game_a > 4 and @game_b == 3 ) 
      return "a"
    elsif (@game_b > 3 and @game_a < 3) or (@game_b > 4 and @game_a == 3 ) 
      return "b"
    end
    return false
  end
  
  
end