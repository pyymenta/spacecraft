# frozen_string_literal: true

require_relative 'rspec'
require_relative 'rocket'

it 'increases the speed' do
  rocket = Rocket.new

  rocket.speed_up

  expect(rocket.speed).to eq(1)
end

it 'decreases the speed to the minium of zero' do
  rocket = Rocket.new(speed: 5)

  rocket.speed_down
  rocket.speed_down
  rocket.speed_down

  expect(rocket.speed).to eq(2)
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

it 'display minimum speed on s' do
  rocket = Rocket.new(speed: 1)

  rocket.down

  expect(rocket.speed).to eq(1)
  expect(rocket.y).to     eq(1)

  rocket.down

  expect(rocket.speed).to eq(1)
  expect(rocket.y).to     eq(2)
end

it 'move left on a when speed 0' do
  rocket = Rocket.new(speed: 0, y: 0)

  rocket.left

  expect(rocket.speed).to eq(0)
  expect(rocket.x).to eq(0)
  expect(rocket.y).to eq(0)
end

it 'move left on a' do
  rocket = Rocket.new(speed: 2, y: 0)

  rocket.left

  expect(rocket.speed).to eq(2)
  expect(rocket.x).to eq(-1)
  expect(rocket.y).to eq(2)
end

it 'move right on a when speed 0' do
  rocket = Rocket.new(speed: 0, y: 0)

  rocket.right

  expect(rocket.speed).to eq(0)
  expect(rocket.x).to eq(0)
  expect(rocket.y).to eq(0)
end

it 'move right on a' do
  rocket = Rocket.new(speed: 2, y: 0)

  rocket.right

  expect(rocket.speed).to eq(2)
  expect(rocket.x).to eq(1)
  expect(rocket.y).to eq(2)
end

it 'display wrong trajectory to the left' do
  rocket = Rocket.new(speed: 2, x: -5)

  rocket.left

  expect(rocket.speed).to eq(2)
  expect(rocket.x).to eq(-5)
  expect(rocket.y).to eq(0)
end

it 'display wrong trajectory to the right' do
  rocket = Rocket.new(speed: 2, x: 5)

  rocket.right

  expect(rocket.speed).to eq(2)
  expect(rocket.x).to eq(5)
  expect(rocket.y).to eq(0)
end
