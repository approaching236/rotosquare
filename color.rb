class Color
  def initialize(num)
    @num = num
    @enum = [
      {:red => 0, :green => 0, :blue => 255},
      {:red => 255, :green => 0, :blue => 0},
      {:red => 0, :green => 255, :blue => 0},
      {:red => 0, :green => 150, :blue => 150},
      {:red => 150, :green => 150, :blue => 0},
      {:red => 150, :green => 0, :blue => 150}
    ]
  end

  def random
    @enum[rand(@num)]
  end
end
