class Game < ApplicationRecord
  has_one :white_player, class_name: 'User'
  has_one :black_player, class_name: 'User'
  has_one :winning_player, class_name: 'User'
end
