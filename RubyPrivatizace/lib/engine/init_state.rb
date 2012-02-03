#= Init State
# State for loading data and preparing structures
class InitialState < StateMachine

  def initialize(base)
    super    
    @loading_screen = Gosu::Image.new(base, './media/window/loading-screen.png', true)
    @loaded = false
  end
    
  # Main initialization loop
  def update
    unless @loaded
      required_files.each { |file| print "Requiring file: #{ file }: "; print require(file).to_s+"\n" }
      
      Block.bootstrap(base)    
      Score.bootstrap(base)
      Menu.bootstrap(base)
      
      
      players = []      
      base.game_objects[:players] =  players     
      
      base.game_objects[:background] = Gosu::Image.new(base, './media/window/bg.png', true)
      base.game_objects[:menu_background] = Gosu::Image.new(base, './media/window/menu-bg.png', true)
      base.game_objects[:pause_overlay] = Gosu::Image.new(base, './media/window/paused-overlay.png', true)
      base.game_objects[:grid] = Grid.new(:columns => 16, :rows => 16)      
      base.game_objects[:menu] = Menu.new
      

      
      #base.game_objects[:cursor] = Cursor.new(:shape => Shape.random, :location => base.game_objects[:grid].cursor_origin)
      #base.game_objects[:next_shape] = Shape.random
      base.game_objects[:score] = Score.new(:columns => 16, :rows => 16) #Gosu::Font.new(base, Gosu::default_font_name, 30)    
      
      
      @loaded = true
    else
      #base.state = PlayingState.new(base)
      base.state = MenuState.new(base)
    end
  end  
  
  def draw
    @loading_screen.draw(0, 0, 0)
  end
  
  def button_down(id)
  end
  
  def button_up(id)
  end
  
  # Files to load during InitState
  protected  
  def required_files      
    %w{
        ./objects/block        
        ./objects/grid
        ./objects/player
        ./objects/score        
        ./objects/menu        
    }
  end
  
end