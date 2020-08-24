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

it 'display message when reaches the maximum speed' do
  rocket = Rocket.new(speed: 5)

  rocket.up

  expect(rocket.speed).to eq(5)
  expect(rocket.y).to eq(5)
  expect(rocket.x).to eq(0)
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

it 'when press w: moves up' do
  rocket = Rocket.new

  expect(rocket.up).to eq("(0, 1)")

  expect(rocket.y).to eq(1)

  rocket.up

  expect(rocket.y).to eq(3)
end

it 'when press w and reaches 0, 250: prints on the moon' do
  rocket = Rocket.new(y: 249)

  expect(rocket.up).to eq('on the moon')
end

it 'when press a and reaches 0, 250: prints on the moon' do
  rocket = Rocket.new(speed: 1, x: 1, y: 249)

  expect(rocket.left).to eq('on the moon')
end

it 'when press d and reaches 0, 250: prints on the moon' do
  rocket = Rocket.new(speed: 1, x: -1, y: 249)

  expect(rocket.right).to eq('on the moon')
end

it 'when press s and reaches 0, 250: prints on the moon' do
  rocket = Rocket.new(speed: 2, y: 249)

  expect(rocket.down).to eq('on the moon')
end
