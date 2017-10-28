class Game < ApplicationRecord
  scope :available, -> { where('black_player_id IS NULL or white_player_id IS NULL') }
  has_one :white_player, class_name: 'User', dependent: false
  has_one :black_player, class_name: 'User', dependent: false
  has_one :winning_player, class_name: 'User', dependent: false
  has_many :pieces, dependent: false

  def populate_board!
    Rook.create(position_x: 0, position_y: 0, game: self, color: 'black')
    Knight.create(position_x: 0, position_y: 1, game: self, color: 'black')
    Bishop.create(position_x: 0, position_y: 2, game: self, color: 'black')
    Queen.create(position_x: 0, position_y: 3, game: self, color: 'black')
    King.create(position_x: 0, position_y: 4, game: self, color: 'black')
    Bishop.create(position_x: 0, position_y: 5, game: self, color: 'black')
    Knight.create(position_x: 0, position_y: 6, game: self, color: 'black')
    Rook.create(position_x: 0, position_y: 7, game: self, color: 'black')

    Rook.create(position_x: 7, position_y: 0, game: self, color: 'white')
    Knight.create(position_x: 7, position_y: 1, game: self, color: 'white')
    Bishop.create(position_x: 7, position_y: 2, game: self, color: 'white')
    Queen.create(position_x: 7, position_y: 3, game: self, color: 'white')
    King.create(position_x: 7, position_y: 4, game: self, color: 'white')
    Bishop.create(position_x: 7, position_y: 5, game: self, color: 'white')
    Knight.create(position_x: 7, position_y: 6, game: self, color: 'white')
    Rook.create(position_x: 7, position_y: 7, game: self, color: 'white')

    0.upto(7) do |b| # b to stand in for black for now
      Pawn.create(position_x: 1, position_y: b, game: self, color: 'black')
    end

    0.upto(7) do |w| # w to stand in for white for now
      Pawn.create(position_x: 6, position_y: w, game: self, color: 'white')
    end
  end

  def check?
    white_king = King.find_by(color: 'white')
    black_king = King.find_by(color: 'black')

    pawns = Pawn.all
    knights = Knight.all
    bishops = Bishop.all
    rooks = Rook.all
    queens = Queen.all

    pawns.each do |pawn|
      if pawn.valid_move?(white_king.position_x, white_king.position_y) && pawn.color != white_king.color
        return true
      end

      if pawn.valid_move?(black_king.position_x, black_king.position_y) && pawn.color != black_king.color
        return true
      end
    end

    knights.each do |knight|
      if knight.valid_move?(white_king.position_x, white_king.position_y) && knight.color != white_king.color
        return true
      end

      if knight.valid_move?(black_king.position_x, black_king.position_y) && knight.color != black_king.color
        return true
      end
    end

    bishops.each do |bishop|
      if bishop.valid_move?(white_king.position_x, white_king.position_y) && bishop.color != white_king.color
        return true
      end

      if bishop.valid_move?(black_king.position_x, black_king.position_y) && bishop.color != black_king.color
        return true
      end
    end

    rooks.each do |rook|
      if rook.valid_move?(white_king.position_x, white_king.position_y) && rook.color != white_king.color
        return true
      end

      if rook.valid_move?(black_king.position_x, black_king.position_y) && rook.color != black_king.color
        return true
      end
    end

    queens.each do |queen|
      if queen.valid_move?(white_king.position_x, white_king.position_y) && queen.color != white_king.color
        return true
      end

      if queen.valid_move?(black_king.position_x, black_king.position_y) && queen.color != black_king.color
        return true
      end
    end

    false
  end
end
