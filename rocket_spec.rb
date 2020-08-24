# frozen_string_literal: true

require_relative 'rspec'
require_relative 'rocket'

it 'increases the speed' do
  rocket = Rocket.new

  rocket.speed_up

  expect(rocket.speed).to eq(1)
end

it 'decreases the speed to the minium of zero' do
  rocket = Rocket.new(speed: 2)

  rocket.speed_down
  rocket.speed_down
  rocket.speed_down

  expect(rocket.speed).to eq(0)
end

it 'moves up on w' do
  rocket = Rocket.new

  rocket.up

  expect(rocket.y).to eq(1)

  rocket.up

  expect(rocket.y).to eq(3)
end

it 'moves down on s' do
  rocket = Rocket.new(speed: 3, y: 3)

  rocket.down

  expect(rocket.speed).to eq(2)
  expect(rocket.y).to     eq(5)

  rocket.down

  expect(rocket.speed).to eq(1)
  expect(rocket.y).to     eq(6)
end
