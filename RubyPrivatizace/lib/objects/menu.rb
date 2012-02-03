# Class for managing score and for decidin winner
class Menu
  
  def self.bootstrap(gosu_window)
    @@gosu_window = gosu_window  
    
    colors = %w{red blue green yellow}
    @@players_icons = []
    4.times { |i|    
      @@players_icons[i] = Gosu::Image.new(@@gosu_window, "media/grid/hrac."+colors[i]+".png", false)      
    }
    
  end
  
  # Initialize Score and setup fonts
  def initialize()
    
    
    @labels = []    
    
    @labels.push Gosu::Font.new(@@gosu_window, Gosu::default_font_name, 30)    
    @labels.push Gosu::Font.new(@@gosu_window, Gosu::default_font_name, 30)    
    @labels.push Gosu::Font.new(@@gosu_window, Gosu::default_font_name, 30)    
    @labels.push Gosu::Font.new(@@gosu_window, Gosu::default_font_name, 30)    
    
    @start_button = Gosu::Font.new(@@gosu_window, Gosu::default_font_name, 30)    
  end
  
   
  # Standard Gosu method for Score
  def draw(players, selected)      
    0.upto(3) do |i|      
      pl = players[i] ? "Player" : "None"
      cl = selected==i ? 0xff00ffff : 0xffffffff
      @labels[i].draw_rel(pl, 200, 80+i*40, 1, 0.5, 0.5, 1, 1, cl, :default)
      @@players_icons[i].draw(450, 70+i*40, 1, 1, 1)
    end    
    @start_button.draw_rel("Start Game", 200, 500, 1, 0.5, 0.5, 1, 1, selected==4 ? 0xff00ffff : 0xffffffff, :default)
  end
  
end