# Menu players selection
# - select players with keyboard and then press Start game
class MenuState < StateMachine

  def initialize(base)
    super   
    
    @privatizace = base.game_objects[:privatizace]    
    @players = base.game_objects[:players]
    @background = base.game_objects[:menu_background]
    #@players = base.game_objects[:players]       
    
    @menu = base.game_objects[:menu]
    
    @pause_overlay = base.game_objects[:pause_overlay]    
    
    @selected_row = 0
    @players_to_play = [true,true,false,false]
    
    @play = false    
  end
  
  def update
    unless @play
    
      @time_since_click ||= Gosu::milliseconds
      if @time_since_click + 200 < Gosu::milliseconds 
        reset_locks
      end
    
      unless false          
    
        if base.button_down?(Gosu::Button::KbLeft) or base.button_down?(Gosu::Button::KbA)
          return if key_locked?
          lock_left
          @players_to_play[@selected_row] = !@players_to_play[@selected_row]          
        end
    
        if base.button_down?(Gosu::Button::KbRight)or base.button_down?(Gosu::Button::KbD)
          return if key_locked?
          lock_right
          @players_to_play[@selected_row] = !@players_to_play[@selected_row]
        end
    
        if base.button_down?(Gosu::Button::KbDown)or base.button_down?(Gosu::Button::KbS)
          return if key_locked?
          lock_down
          @selected_row=(@selected_row+1)%5
        end
    
        if base.button_down?(Gosu::Button::KbUp)or base.button_down?(Gosu::Button::KbW)
          return if key_locked?
          lock_up
          @selected_row=(@selected_row-1)%5
        end
      
        if base.button_down?(Gosu::Button::KbReturn) or base.button_down?(Gosu::Button::KbEnter) or base.button_down?(Gosu::Button::KbLeftControl)
          return if key_locked?
          lock_put
          #@players[@active_player].put
          if @selected_row == 4 
            @play = true
          else
            @players_to_play[@selected_row] = !@players_to_play[@selected_row]          
          end
        end
        #@grid.reset_row_objects
      else
      
      end
    else
      @players << Player.new(base, 0, "red", 2,2) if @players_to_play[0]
      @players << Player.new(base, 1, "blue",2,13) if @players_to_play[1]
      @players << Player.new(base, 2, "green",13,2) if @players_to_play[2]
      @players << Player.new(base, 3, "yellow", 13,13) if @players_to_play[3]
      base.game_objects[:playing] = @players_to_play
      if @players.length > 1
        base.state = PlayingState.new(base)
      else 
        @players = []
        @play = false
      end
    end
  end
  
  def draw
    @background.draw(0, 0, 0)
    @menu.draw(@players_to_play,@selected_row)
    #@grid.draw
    #@players.each { |p| p.draw  }
    #@cursor.draw
    #@score.draw_rel(@tetris.score.to_s.rjust(6, '0'), 440, 250, 1, 0.5, 0.5, 1, 1, 0xffffffff, :default)
    #@current_difficult_level.draw_rel(@tetris.difficulty_level.to_s, 440, 390, 1, 0.5, 0.5, 1, 1, 0xffffffff, :default)
    #base.game_objects[:next_shape].draw
    #@pause_overlay.draw(10, 10, 20) if @paused
  end
  
  def button_down(id)
    base.close if id == Gosu::Button::KbEscape
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