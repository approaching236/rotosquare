class Square
  attr_accessor :color_spec

  def initialize(window, options = {})
    @image = Gosu::Image.new(window, "media/square.png", false)
    @color = Gosu::Color.new(0xff000000)
    @color_spec = options[:color_spec]

    @color.red = options[:color_spec][:red]
    @color.green = options[:color_spec][:green]
    @color.blue = options[:color_spec][:blue]
    @x = 0.0
    @y = 0.0
  end

  def ==(other)
    self.color_spec == other.color_spec if (other.respond_to?(:color_spec))
  end

  def draw_at_coords(x, y)
    @x = x
    @y = y
    draw
  end

  def draw
    #x, y, z, x_factor, y_factor, color, mode
    @image.draw(@x * 50, @y * 50, 1, 1, 1, @color, :default)
  end
end
