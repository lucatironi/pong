class Player
  WIDTH  = 16
  HEIGHT = 64
  SPEED  = 4

  attr_reader :x, :y, :score

  def initialize(x, y)
    @score = 0
    @initial_x = x
    @initial_y = y
    reset
  end

  def update
  end

  def draw
    $window.draw_quad(
      @x - WIDTH / 2, @y - HEIGHT / 2, Gosu::Color::WHITE,
      @x + WIDTH / 2, @y - HEIGHT / 2, Gosu::Color::WHITE,
      @x + WIDTH / 2, @y + HEIGHT / 2, Gosu::Color::WHITE,
      @x - WIDTH / 2, @y + HEIGHT / 2, Gosu::Color::WHITE,
    )
  end

  def reset
    @x = @initial_x
    @y = @initial_y
  end

  def move_up
    @y -= SPEED
    @y = [HEIGHT / 2, @y].max
  end

  def move_down
    @y += SPEED
    @y = [$window.height - HEIGHT / 2, @y].min
  end

  def hits?(object)
    (@x - object.x).abs < WIDTH / 2 && (@y - object.y).abs < HEIGHT / 2
  end

  def increment_score
    @score += 1
  end
end
