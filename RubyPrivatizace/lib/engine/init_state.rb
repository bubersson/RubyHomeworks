# Init State
#
class InitialState < StateMachine

  def initialize(base)
    super    
    @loading_screen = Gosu::Image.new(base, './media/window/loading-screen.png', true)
    @loaded = false
  end
  
  
  
  def update
    unless @loaded
      required_files.each { |file| print "Requiring file: #{ file }: "; print require(file).to_s+"\n" }
      
      Block.bootstrap(base)     
      
      
      players = []
      players << Player.new(base, 1, "red")
      players << Player.new(base, 2, "blue")
      players << Player.new(base, 3, "green")
      players << Player.new(base, 4, "yellow")
      base.game_objects[:players] =  players
      
      
      base.game_objects[:background] = Gosu::Image.new(base, './media/window/bg.png', true)
      base.game_objects[:pause_overlay] = Gosu::Image.new(base, './media/window/paused-overlay.png', true)
      base.game_objects[:grid] = Grid.new(:columns => 16, :rows => 16)
      base.game_objects[:privatizace] = Privatizace.new
      

      
      #base.game_objects[:cursor] = Cursor.new(:shape => Shape.random, :location => base.game_objects[:grid].cursor_origin)
      #base.game_objects[:next_shape] = Shape.random
      #base.game_objects[:score] = Gosu::Font.new(base, Gosu::default_font_name, 40)
    
      @loaded = true
    else
      base.state = PlayingState.new(base)
    end
  end
  
  def draw
    @loading_screen.draw(0, 0, 0)
  end
  
  def button_down(id)
  end
  
  def button_up(id)
  end
  
  protected
  
    def required_files      
      %w{
        ./objects/block
        ./objects/grid
        ./objects/row
        ./objects/tetris
        ./objects/location
        ./objects/shape_location
        ./objects/grid_location
        ./objects/cursor
      }
      %w{
        ./objects/block        
        ./objects/grid
        ./objects/player
        ./objects/privatizace        
      }
    end
  
end