class Game < ApplicationRecord
  scope :available, -> { where('black_player_id IS NULL or white_player_id IS NULL') }
  has_one :white_player, class_name: 'User', dependent: false
  has_one :black_player, class_name: 'User', dependent: false
  has_one :winning_player, class_name: 'User', dependent: false
  has_many :pieces, dependent: false

  def populate_board!
    Rook.create(position_x: 0, position_y: 7, game: self, color: 'black')
    Knight.create(position_x: 1, position_y: 7, game: self, color: 'black')
    Bishop.create(position_x: 2, position_y: 7, game: self, color: 'black')
    Queen.create(position_x: 3, position_y: 7, game: self, color: 'black')
    King.create(position_x: 4, position_y: 7, game: self, color: 'black')
    Bishop.create(position_x: 5, position_y: 7, game: self, color: 'black')
    Knight.create(position_x: 6, position_y: 7, game: self, color: 'black')
    Rook.create(position_x: 7, position_y: 7, game: self, color: 'black')

    Rook.create(position_x: 0, position_y: 0, game: self, color: 'white')
    Knight.create(position_x: 1, position_y: 0, game: self, color: 'white')
    Bishop.create(position_x: 2, position_y: 0, game: self, color: 'white')
    Queen.create(position_x: 3, position_y: 0, game: self, color: 'white')
    King.create(position_x: 4, position_y: 0, game: self, color: 'white')
    Bishop.create(position_x: 5, position_y: 0, game: self, color: 'white')
    Knight.create(position_x: 6, position_y: 0, game: self, color: 'white')
    Rook.create(position_x: 7, position_y: 0, game: self, color: 'white')

    0.upto(7) do |b| # b to stand in for black for now
      Pawn.create(position_x: b, position_y: 6, game: self, color: 'black')
    end

    0.upto(7) do |w| # w to stand in for white for now
      Pawn.create(position_x: w, position_y: 1, game: self, color: 'white')
    end
  end

  def check?
    white_king = King.find_by(color: 'white', game: self)
    black_king = King.find_by(color: 'black', game: self)

    pieces.where.not(type: 'King').find_each do |piece|
      return true if piece.valid_move?(white_king.position_x, white_king.position_y) && piece.color != white_king.color
      return true if piece.valid_move?(black_king.position_x, black_king.position_y) && piece.color != black_king.color
    end

    false
  end
end
