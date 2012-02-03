

# Class for managing score and for decidin winner
class Score
  
  def self.bootstrap(gosu_window)
    @@gosu_window = gosu_window  
    
    colors = %w{red blue green yellow}
    @@players_icons = []
    4.times { |i|    
      @@players_icons[i] = Gosu::Image.new(@@gosu_window, "media/grid/hrac."+colors[i]+".png", false)      
    }
    
  end
  
  # Initialize Score and setup fonts
  def initialize(options)
    @width, @height = options[:rows], options[:columns]
    @score = [0,0,0,0]
    @labels = []    
    
    @labels.push Gosu::Font.new(@@gosu_window, Gosu::default_font_name, 30)    
    @labels.push Gosu::Font.new(@@gosu_window, Gosu::default_font_name, 30)    
    @labels.push Gosu::Font.new(@@gosu_window, Gosu::default_font_name, 30)    
    @labels.push Gosu::Font.new(@@gosu_window, Gosu::default_font_name, 30)    
  end
  
   
  # Standard Gosu method for Score
  def draw        
    0.upto(3) do |i|      
      @labels[i].draw_rel(@score[i].to_s()+" 000 $", 540, 80+i*40, 1, 0.5, 0.5, 1, 1, 0xffffffff, :default)
      @@players_icons[i].draw(450, 70+i*40, 1, 1, 1)
    end    
  end
  
  
  def update_score(arr)
    @score = arr
  end
  
end