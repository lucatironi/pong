class Billboard
  def initialize
  end

  def update(players)
    @scores = Gosu::Image.from_text(
      $window, "#{players.map(&:score).join(' : ')}",
      Gosu.default_font_name, 30)
  end

  def draw
    @scores.draw($window.width / 2 - @scores.width / 2, 32, 10)
  end
end
