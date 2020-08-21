# frozen_string_literal: true

class Rocket
  attr_reader :speed

  def initialize
    @speed = 0
  end

  def speed_up
    @speed += 1
  end
end
