class Ball
  SIZE  = 16
  SPEED = 4

  attr_reader :x, :y

  def initialize(window)
    @window  = window
    reset
  end

  def update
    @x += @speed_x
    @y += @speed_y
    if @y > @window.height || @y < 0
      @speed_y *= -1
    end
  end

  def draw
    @window.draw_quad(
      @x - SIZE / 2, @y - SIZE / 2, Gosu::Color::WHITE,
      @x + SIZE / 2, @y - SIZE / 2, Gosu::Color::WHITE,
      @x + SIZE / 2, @y + SIZE / 2, Gosu::Color::WHITE,
      @x - SIZE / 2, @y + SIZE / 2, Gosu::Color::WHITE,
    )
  end

  def bounce(from)
    @speed_x *= -1
    @speed_y = from / SIZE / 2
  end

  def reset
    @x = @window.width / 2
    @y = @window.height / 2
    @speed_x = SPEED
    @speed_y = 0
  end

end
