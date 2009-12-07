class Board
  BOARDSIZE = 16
  def initialize(window, level)
    @level = level
    @color_generator = Color.new(@level)
    @color_spec = @color_generator.random

    @board = Array.new(BOARDSIZE)
    @board.map! { |i| i = Array.new(BOARDSIZE) }

    (0..BOARDSIZE-1).to_a.each do |i|
      (0..BOARDSIZE-1).to_a.each do |j|
        @board[i][j] = Square.new(window, :color_spec => @color_generator.random)
      end
    end
  end

  def draw
    (0..BOARDSIZE-1).to_a.each do |i|
      (0..BOARDSIZE-1).to_a.each do |j|
        if @board[i][j] && @board[i][j].respond_to?(:draw_at_coords)
          @board[i][j].draw_at_coords(i, j)
	end
      end
    end
  end
  
  def rotate_left(x, y)
    temp = @board[x][y]
    @board[x][y] = @board[x+1][y]
    @board[x+1][y] = temp
    @board[x+1][y] = @board[x+1][y+1]
    @board[x+1][y+1] = @board[x][y+1]
    @board[x][y+1] = temp
  end

  def rotate_right(x, y)
    temp = @board[x][y]
    @board[x][y] = @board[x][y+1]
    @board[x][y+1] = @board[x+1][y+1]
    @board[x+1][y+1] = @board[x+1][y]
    @board[x+1][y] = temp
  end

  def check_for_complete_squares
    (0..BOARDSIZE-2).to_a.each do |j|
      (0..BOARDSIZE-2).to_a.each do |k|
        if (@board[j][k] == @board[j][k+1] and @board[j][k] == @board[j+1][k+1] and @board[j][k] == @board[j+1][k])
          @board[j][k] = nil
          @board[j][k+1] = nil
          @board[j+1][k+1] = nil
          @board[j+1][k] = nil
        end
      end
    end
  #  if (@board[0][0] == @board[0][1] and @board[0][0] == @board[1][1] and @board[0][0] == @board[1][0])
  #    @board[0][0] = nil
  #    @board[0][1] = nil
  #    @board[1][1] = nil
  #    @board[1][0] = nil
  #  end
  end
end
