#!/usr/bin/env ruby

require 'gosu'
require_relative 'entities/ball'
require_relative 'entities/player'
require_relative 'entities/billboard'

class GameWindow < Gosu::Window
  attr_reader :width, :height

  def initialize(width = 800, height = 600, fullscreen = false)
    super
    self.caption = 'Pong'

    @width  = width
    @height = height

    @ball = Ball.new(self)
    @player_one = Player.new(self, 24, height / 2)
    @player_two = Player.new(self, width - 24, height / 2)
    @players = [@player_one, @player_two]
    @billboard = Billboard.new(self)
  end

  def update
    close if button_down?(Gosu::KbEscape)

    @player_one.move_up if button_down?(Gosu::KbW)
    @player_one.move_down if button_down?(Gosu::KbS)

    @player_two.move_up if button_down?(Gosu::KbUp)
    @player_two.move_down if button_down?(Gosu::KbDown)

    @ball.bounce(@ball.y - @player_one.y) if @player_one.hits?(@ball)
    @ball.bounce(@ball.y - @player_two.y) if @player_two.hits?(@ball)

    if @ball.x < 0
      @player_two.increment_score
      @ball.reset
    end
    if @ball.x > @width
      @player_one.increment_score
      @ball.reset
    end

    @ball.update
  end

  def draw
    @billboard.draw(@players)
    @ball.draw
    @player_one.draw
    @player_two.draw
  end
end

$window = GameWindow.new
$window.show
