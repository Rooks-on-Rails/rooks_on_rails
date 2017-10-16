class Game < ApplicationRecord
  scope :available, -> { where('black_player_id IS NULL or white_player_id IS NULL') }
  has_one :white_player, class_name: 'User', dependent: false
  has_one :black_player, class_name: 'User', dependent: false
  has_one :winning_player, class_name: 'User', dependent: false
  has_many :pieces, dependent: false

  def populate_board!
    rook = Rook.create(position_x: 0, position_y: 0, game: self, color: 'black', user_id: 1)
    Knight.create(position_x: 0, position_y: 1, game: self, color: 'black', user_id: 1)
    Bishop.create(position_x: 0, position_y: 2, game: self, color: 'black', user_id: 1)
    Queen.create(position_x: 0, position_y: 3, game: self, color: 'black', user_id: 1)
    King.create(position_x: 0, position_y: 4, game: self, color: 'black', user_id: 1)
    Bishop.create(position_x: 0, position_y: 5, game: self, color: 'black', user_id: 1)
    Knight.create(position_x: 0, position_y: 6, game: self, color: 'black', user_id: 1)
    Rook.create(position_x: 0, position_y: 7, game: self, color: 'black', user_id: 1)

    Rook.create(position_x: 7, position_y: 0, game: self, color: 'white', user_id: 1)
    Knight.create(position_x: 7, position_y: 1, game: self, color: 'white', user_id: 1)
    Bishop.create(position_x: 7, position_y: 2, game: self, color: 'white', user_id: 1)
    Queen.create(position_x: 7, position_y: 3, game: self, color: 'white', user_id: 1)
    King.create(position_x: 7, position_y: 4, game: self, color: 'white', user_id: 1)
    Bishop.create(position_x: 7, position_y: 5, game: self, color: 'white', user_id: 1)
    Knight.create(position_x: 7, position_y: 6, game: self, color: 'white', user_id: 1)
    Rook.create(position_x: 7, position_y: 7, game: self, color: 'white', user_id: 1)

    0.upto(7) do |b| # b to stand in for black for now
      Pawn.create(position_x: 1, position_y: b, game: self, color: 'black', user_id: 1)
    end

    0.upto(7) do |w| # w to stand in for white for now
      Pawn.create(position_x: 6, position_y: w, game: self, color: 'white', user_id: 1)
    end
  end
end
