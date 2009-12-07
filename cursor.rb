class Cursor
  def initialize(window, board_size)
    @board_size = board_size
    @x = @y = 0
    @image = Gosu::Image.new(window, "media/cursor.png", false)
  end

  def rotate_right(board)
    board.rotate_right(@x, @y)    
  end
  
  def rotate_left(board)
    board.rotate_left(@x, @y)    
  end

  def move_right 
    if @x < @board_size - 2
      @x += 1
    end
  end

  def move_left
    if @x > 0
      @x -= 1
    end
  end

  def move_down
    if @y < @board_size - 2
      @y += 1
    end
  end

  def move_up
    if @y > 0
      @y -= 1
    end
  end

  def draw
    @image.draw(@x * 50, @y * 50, 2)
  end

end
