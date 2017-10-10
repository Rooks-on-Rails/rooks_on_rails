class Game < ApplicationRecord
  scope :available, -> { where (white_player_id == NULL || black_player_id == NULL) }
  has_one :white_player, class_name: 'User', dependent: false
  has_one :black_player, class_name: 'User', dependent: false
  has_one :winning_player, class_name: 'User', dependent: false
end
