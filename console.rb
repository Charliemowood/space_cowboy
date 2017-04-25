require 'pry-byebug'
require_relative 'models/bounty.rb'

space_cowboy1 = Bounty.new({
  'name' => 'Paul',
  'species' => 'Crocoalien',
  'bounty_value' => 10_000,
  'favourite_weapon' => 'space gun'
})

space_cowboy1.save()

space_cowboy2 = Bounty.new({
  'name' => 'Charlie',
  'species' => 'Reptoalien',
  'bounty_value' => 1234,
  'favourite_weapon' => 'ray gun'
})

space_cowboy2.save()



binding.pry
nil