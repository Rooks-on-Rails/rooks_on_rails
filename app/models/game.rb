class Game < ApplicationRecord
  has_one :white_player
  has_one :black_player
  has_one :winning_player
end
