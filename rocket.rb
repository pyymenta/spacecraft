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
    print "(#{@x}, #{@y})"
  end

  def speed_down
    if @speed == 1 
      puts "Minimum Speed"
      return
    end
    @speed = @speed.positive? ? @speed - 1 : 0
  end

  def speed_up
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
    if @x == -5
      puts "Wrong Trajectory"
      return
    end
    
    @x -= 1
    move
  end

  def right
    return if @speed.zero?
    if @x == 5
      puts "Wrong Trajectory"
      return
    end
    
    @x += 1
    move
  end
end
