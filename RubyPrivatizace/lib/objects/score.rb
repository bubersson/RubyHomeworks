

# Class for managing score and for decidin winner
class Score 
  
  # Staticaly initialize windowd variable and image icons
  def self.bootstrap(gosu_window)
    @@gosu_window = gosu_window  
    
    colors = %w{red blue green yellow}
    @@players_icons = []
    4.times { |i|    
      @@players_icons[i] = Gosu::Image.new(@@gosu_window, "media/grid/hrac."+colors[i]+".png", false)      
    }
    
  end
  
  # Initialize Score and setup fonts
  def initialize(labels)
    @score = [0,0,0,0]
    @started = [false,false,false,false]
    @labels = []    
    
    @players = []
    @playing =[]
    @labels = labels
    @winner = nil
    
  end
  
   
  # Standard Gosu method for Score
  def draw        
    0.upto(3) do |i|            
      if @playing[i]
        if @winner == i
          @labels[i].draw_rel(" Winner", 540, 80+i*40, 1, 0.5, 0.5, 1, 1, 0xff0000ff, :default)      
        else
          @labels[i].draw_rel(@score[i].to_s()+" 000 $", 540, 80+i*40, 1, 0.5, 0.5, 1, 1, 0xffffffff, :default)
        end
      else
        @labels[i].draw_rel(" out", 540, 80+i*40, 1, 0.5, 0.5, 1, 1, 0xdddddddd, :default)
      end
      
      @@players_icons[i].draw(450, 70+i*40, 1, 1, 1)
    end    
  end
  
  # Set score to new value
  def update_score(arr)    
    @score = arr    
    0.upto(3) { |i|
      @started[i] = true if arr[i] > 0
    }
  end
  
  
  # Check winners and losers
  def check_winner
    count = 0
    index = -1
    0.upto(3) {|i|
      if @playing[i] 
        if @score[i] == 0 and @started[i]
          @playing[i] = false
          @players.delete_if { |p| p.id == i}           
        else
          count += 1
          index = i
        end
      end      
    }
    @winner = index if count < 2 
    return count < 2 ? index : -1
  end
  
  def set_players(pl, playing)
    @players = pl
    @playing = playing
  end
  
end