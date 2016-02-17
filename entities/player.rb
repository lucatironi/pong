class Player
  WIDTH  = 16
  HEIGHT = 64
  SPEED  = 4

  attr_reader :x, :y, :score

  def initialize(window, x, y)
    @window = window
    @score = 0
    reset(x, y)
  end

  def update
  end

  def draw
    @window.draw_quad(
      @x - WIDTH / 2, @y - HEIGHT / 2, Gosu::Color::WHITE,
      @x + WIDTH / 2, @y - HEIGHT / 2, Gosu::Color::WHITE,
      @x + WIDTH / 2, @y + HEIGHT / 2, Gosu::Color::WHITE,
      @x - WIDTH / 2, @y + HEIGHT / 2, Gosu::Color::WHITE,
    )
  end

  def reset(new_x, new_y)
    @x = new_x
    @y = new_y
  end

  def move_up
    @y -= SPEED
    @y = [HEIGHT / 2, @y].max
  end

  def move_down
    @y += 5
    @y = [@window.height - HEIGHT / 2, @y].min
  end

  def hits?(object)
    (@x - object.x).abs < WIDTH / 2 && (@y - object.y).abs < HEIGHT / 2
  end

  def increment_score
    @score += 1
  end
end
