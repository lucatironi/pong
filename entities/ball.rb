class Ball
  SIZE  = 16
  SPEED = 8

  attr_reader :x, :y

  def initialize
    reset
  end

  def update
    @x += @speed_x
    @y += @speed_y
    if @y > $window.height || @y < 0
      @speed_y *= -1
    end
  end

  def draw
    $window.draw_quad(
      @x - SIZE / 2, @y - SIZE / 2, Gosu::Color::WHITE,
      @x + SIZE / 2, @y - SIZE / 2, Gosu::Color::WHITE,
      @x + SIZE / 2, @y + SIZE / 2, Gosu::Color::WHITE,
      @x - SIZE / 2, @y + SIZE / 2, Gosu::Color::WHITE,
    )
  end

  def bounce(from)
    puts "from: #{from}, speed x: #{@speed_x}, y: #{@speed_y}"
    @speed_x *= -1
    @speed_y = from / SIZE
  end

  def reset
    @x = $window.width / 2
    @y = $window.height / 2
    @speed_x = SPEED
    @speed_y = 0
  end
end
