# frozen_string_literal: true

class Rocket
  attr_reader :speed, :x, :y

  MOON_Y_POSITION = 250
  MOON_X_POSITION = 0
  MAX_LEFT_POSITION = -5
  MAX_RIGHT_POSITION = 5
  MAX_SPEED = 5
  MIN_SPEED = 1

  private_constant :MOON_X_POSITION
  private_constant :MAX_LEFT_POSITION
  private_constant :MAX_RIGHT_POSITION
  private_constant :MAX_SPEED
  private_constant :MIN_SPEED

  def initialize(speed: 0, x: 0, y: 0)
    @speed = speed
    @x     = x
    @y     = y
  end

  def move
    @y += @speed

    case @y
      when ->(number) { on_the_moon?(number) }
        stream(:on_the_moon)
      when (251..Float::INFINITY)
        stream(:contact_lost)
      else
        stream(:position)
    end
  end

  def speed_down
    return stream(:minimum_speed) if @speed == MIN_SPEED

    @speed = @speed.positive? ? @speed - 1 : 0
  end

  def speed_up
    return stream(:maximum_speed) if @speed == MAX_SPEED

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
    return stream(:wrong_trajectory) if @x == MAX_LEFT_POSITION

    @x -= 1

    move
  end

  def right
    return if @speed.zero?
    return stream(:wrong_trajectory) if @x == MAX_RIGHT_POSITION

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
      contact_lost: 'contact lost',
    }[type]
  end

  private

  def on_the_moon?(number = @y)
    @x == MOON_X_POSITION && number == MOON_Y_POSITION
  end
end
