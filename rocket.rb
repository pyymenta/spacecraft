# frozen_string_literal: true

class Rocket
  attr_reader :speed, :x, :y

  def initialize(speed: 0, x: 0, y: 0)
    @speed = speed
    @x     = x
    @y     = y
  end

  def move
    @y += @speed

    on_the_moon? ? stream(:on_the_moon) : stream(:position)
  end

  def speed_down
    return stream(:minimum_speed) if @speed == 1

    @speed = @speed.positive? ? @speed - 1 : 0
  end

  def speed_up
    return stream(:maximum_speed) if @speed == 5

    @speed += 1
  end

  def up
    speed_up
    move
  end

  def down
    speed_down
    move
  end

  def left
    return if @speed.zero?
    return stream(:wrong_trajectory) if @x == -5

    @x -= 1

    move
  end

  def right
    return if @speed.zero?
    return stream(:wrong_trajectory) if @x == 5

    @x += 1

    move
  end

  def stream(type)
    {
      maximum_speed:    'maximum speed',
      minimum_speed:    'minimum speed',
      on_the_moon:      'on the moon',
      position:         "(#{@x}, #{@y})",
      wrong_trajectory: 'wrong trajectory',
    }[type]
  end

  private

  def on_the_moon?
    @x == 0 && @y == 250
  end
end
