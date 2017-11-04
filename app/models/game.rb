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

    pawns = Pawn.all
    knights = Knight.all
    bishops = Bishop.all
    rooks = Rook.all
    queens = Queen.all

    pawns.each do |pawn|
      return true if pawn.valid_move?(white_king.position_x, white_king.position_y) && pawn.color != white_king.color
      return true if pawn.valid_move?(black_king.position_x, black_king.position_y) && pawn.color != black_king.color
    end

    knights.each do |knight|
      return true if knight.valid_move?(white_king.position_x, white_king.position_y) && knight.color != white_king.color
      return true if knight.valid_move?(black_king.position_x, black_king.position_y) && knight.color != black_king.color
    end

    bishops.each do |bishop|
      return true if bishop.valid_move?(white_king.position_x, white_king.position_y) && bishop.color != white_king.color
      return true if bishop.valid_move?(black_king.position_x, black_king.position_y) && bishop.color != black_king.color
    end

    rooks.each do |rook|
      return true if rook.valid_move?(white_king.position_x, white_king.position_y) && rook.color != white_king.color
      return true if rook.valid_move?(black_king.position_x, black_king.position_y) && rook.color != black_king.color
    end

    queens.each do |queen|
      return true if queen.valid_move?(white_king.position_x, white_king.position_y) && queen.color != white_king.color
      return true if queen.valid_move?(black_king.position_x, black_king.position_y) && queen.color != black_king.color
    end

    false
  end
end
