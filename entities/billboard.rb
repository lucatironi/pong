class Billboard
  def initialize(window)
    @window = window
    @font = Gosu::Font.new(window, 'Arial', 30)
    @x = (@window.width / 2) - 32
    @y = 32
  end

  def draw(players)
    @font.draw("#{players.map(&:score).join(' : ')}", @x, @y, 0)
  end
end
