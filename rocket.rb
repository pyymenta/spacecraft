# frozen_string_literal: true

class Rocket
  attr_reader :speed, :x, :y

  def initialize(speed: 0, x: 0, y: 0)
    @speed = speed
    @x     = x
    @y     = y
  end

  def move
    @y -= 1
  end

  def move
    @y += @speed
  end

  def speed_down
    @speed = @speed.positive? ? @speed - 1 : 0
  end

  def speed_up
    @speed += 1
  end

  def up
    speed_up
    move
  end
end
