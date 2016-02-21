require_relative '../entities/ball'
require_relative '../entities/player'
require_relative '../entities/billboard'

class PlayState < GameState
  def initialize
    @ball = Ball.new
    @player_one = Player.new(24, $window.height / 2)
    @player_two = Player.new($window.width - 24, $window.height / 2)
    @players = [@player_one, @player_two]
    @billboard = Billboard.new
  end

  def enter
  end

  def leave
  end

  def update
    @player_one.move_up if $window.button_down?(Gosu::KbW)
    @player_one.move_down if $window.button_down?(Gosu::KbS)

    @player_two.move_up if $window.button_down?(Gosu::KbUp)
    @player_two.move_down if $window.button_down?(Gosu::KbDown)

    @ball.bounce(@ball.y - @player_one.y) if @player_one.hits?(@ball)
    @ball.bounce(@ball.y - @player_two.y) if @player_two.hits?(@ball)

    if @ball.x < 0
      @player_two.increment_score
      @ball.reset
      @players.each(&:reset)
    end
    if @ball.x > $window.width
      @player_one.increment_score
      @ball.reset
      @players.each(&:reset)
    end

    @ball.update
    @billboard.update(@players)
  end

  def draw
    @billboard.draw
    @ball.draw
    @player_one.draw
    @player_two.draw
  end

  def button_down(id)
    $window.close if id == Gosu::KbQ
    if id == Gosu::KbEscape
      GameState.switch(MenuState.instance)
    end
  end
end
