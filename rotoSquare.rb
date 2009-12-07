require 'rubygems'
require 'gosu'
require 'cursor'
require 'board'
require 'square'
require 'color'

class GameWindow < Gosu::Window
  Wait = 8 
  def initialize
    super(640, 480, false)
    self.caption = "rotoSquare"
    @board = Board.new(self, 6)
    @cursor = Cursor.new(self, Board::BOARDSIZE)
    @wait_timer = 0    
  end

  def update
    @board.check_for_complete_squares

    if button_down? Gosu::Button::KbLeftControl and @wait_timer == 0
      @cursor.rotate_left(@board)
      @wait_timer = Wait
    end

    if button_down? Gosu::Button::KbLeftShift and @wait_timer == 0
      @cursor.rotate_right(@board)
      @wait_timer = Wait
    end

    if button_down? Gosu::Button::KbLeft and @wait_timer == 0
      @cursor.move_left
      @wait_timer = Wait
    end

    if button_down? Gosu::Button::KbRight and @wait_timer == 0
      @cursor.move_right
      @wait_timer = Wait
    end

    if button_down? Gosu::Button::KbUp and @wait_timer == 0
      @cursor.move_up
      @wait_timer = Wait
    end

    if button_down? Gosu::Button::KbDown and @wait_timer == 0
      @cursor.move_down
      @wait_timer = Wait
    end

    if @wait_timer > 0
      @wait_timer -= 1
    end

#    ["Left", "Right", "Up", "Down"].each do |direction|
#      @cursor.send("move_#{direction.downcase}") if button_up Gosu::Button.const_get("Kb#{direction}")
#    end
  end

  def draw
    @board.draw
    @cursor.draw
  end
end

window = GameWindow.new
window.show
