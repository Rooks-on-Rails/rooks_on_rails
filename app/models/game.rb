class Game < ApplicationRecord
  scope :available, -> { where('black_player_id IS NULL or white_player_id IS NULL') }
  has_one :white_player, class_name: 'User', dependent: false
  has_one :black_player, class_name: 'User', dependent: false
  has_one :winning_player, class_name: 'User', dependent: false
  has_many :pieces, dependent: false

  attr_accessor :board_positions

  def initialize
    @board_positions = Array.new(8){Array.new(8, " ")}
  end

  def populate_board!
    @board_positions[0][0] = Rook.new
    @board_positions[0][1] = Knight.new
    @board_positions[0][2] = Bishop.new
    @board_positions[0][3] = Queen.new
    @board_positions[0][4] = King.new
    @board_positions[0][5] = Bishop.new
    @board_positions[0][6] = Knight.new
    @board_positions[0][7] = Rook.new

    @board_positions[7][0] = Rook.new
    @board_positions[7][1] = Knight.new
    @board_positions[7][2] = Bishop.new
    @board_positions[7][3] = Queen.new
    @board_positions[7][4] = King.new
    @board_positions[7][5] = Bishop.new
    @board_positions[7][6] = Knight.new
    @board_positions[7][7] = Rook.new

    0.upto(7) do |b| #b to stand in for black for now
      board[6][b] = Pawn.new
    end

    0.upto(7) do |w| #w to stand in for white for now
      board[1][w] = Pawn.new
    end
  end
end
