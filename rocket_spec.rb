# frozen_string_literal: true

require_relative 'rspec'
require_relative 'rocket'

it 'increases the speed' do
  rocket = Rocket.new

  rocket.speed_up

  expect(rocket.speed).to eq 1
end
