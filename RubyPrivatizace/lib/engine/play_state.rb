
#= Game state
# initialize playing state and then start main Game loop
class PlayingState < StateMachine

  def initialize(base)
    super
    
    @grid = base.game_objects[:grid]
    @privatizace = base.game_objects[:privatizace]    
    @background = base.game_objects[:background]
    @players = base.game_objects[:players]
    @playing = base.game_objects[:playing]
    @active_player = 0
    
    @pause_overlay = base.game_objects[:pause_overlay]
    @score = base.game_objects[:score]
    @score.set_players(@players, @playing)
    @paused = false
    
    
    #nasledující jsou nepoužité
    @cursor = base.game_objects[:cursor]    
    @current_difficult_level = Gosu::Font.new(base, Gosu::default_font_name, 40)
  end
  
  def update
    if base.button_down?(Gosu::Button::KbSpace)
      @time_since_pause ||= Gosu::milliseconds
      return unless @time_since_pause + 100 < Gosu::milliseconds
      
      if @paused
        @paused = false        
      else
        @paused = true        
      end
      
      @time_since_pause = nil
    end
    
    return if @paused
    
    @time_since_click ||= Gosu::milliseconds
    if @time_since_click + 120 < Gosu::milliseconds             
      reset_locks      
    end
    
    unless false          
    
      if base.button_down?(Gosu::Button::KbLeft) or base.button_down?(Gosu::Button::KbA)
        return if key_locked?
        lock_left
        @players[@active_player].left                
      end
    
      if base.button_down?(Gosu::Button::KbRight)or base.button_down?(Gosu::Button::KbD)
        return if key_locked?
        lock_right
        @players[@active_player].right
      end
    
      if base.button_down?(Gosu::Button::KbDown)or base.button_down?(Gosu::Button::KbS)
        return if key_locked?
        lock_down
        @players[@active_player].down 
      end
    
      if base.button_down?(Gosu::Button::KbUp)or base.button_down?(Gosu::Button::KbW)
        return if key_locked?
        lock_up
        @players[@active_player].up        
      end
      
      if base.button_down?(Gosu::Button::KbReturn) or base.button_down?(Gosu::Button::KbEnter) or base.button_down?(Gosu::Button::KbLeftControl)
        return if key_locked?
        lock_put
        #@players[@active_player].put
        if @grid.add_point(@players[@active_player])          
          @score.update_score(@grid.count_points)
          @score.check_winner
          @active_player = (@active_player+1) % @players.size          
        end
      end
      
      @grid.reset_row_objects
    else
      
    end
  end
  
  def draw
    @background.draw(0, 0, 0)
    @grid.draw
    @players.each { |p| p.draw  }
    @score.draw
    
    #@cursor.draw
    #@current_difficult_level.draw_rel(@tetris.difficulty_level.to_s, 440, 390, 1, 0.5, 0.5, 1, 1, 0xffffffff, :default)
    #base.game_objects[:next_shape].draw
    @pause_overlay.draw(10, 10, 20) if @paused
  end
  
  def button_down(id)
    base.close if id == Gosu::Button::KbEscape
    @hold = true
  end
  
  def button_up(id)
    @lock_up = false if id == Gosu::Button::KbUp
    @lock_down = false if id == Gosu::Button::KbDown
    @lock_left = false if id == Gosu::Button::KbLeft
    @lock_right = false if id == Gosu::Button::KbRight
    @lock_put = false if id == Gosu::Button::KbReturn
  end
  
  def lock_left
    @lock_left = true
    @time_since_click= Gosu::milliseconds
  end
  
  def lock_right
    @lock_right = true
    @time_since_click= Gosu::milliseconds
  end
  
  def lock_down
    @lock_down = true
    @time_since_click= Gosu::milliseconds
  end

  def lock_up
    @lock_up = true
    @time_since_click= Gosu::milliseconds
  end
  
  def lock_put
    @lock_put = true
    @time_since_click= Gosu::milliseconds
  end
  
  def key_locked?
    @lock_left or @lock_right or @lock_down or @lock_up or @lock_put  or false
  end
  
  def reset_locks
    @lock_left = @lock_right = @lock_down = @lock_up = @lock_put = false
  end
  
end