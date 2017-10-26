require 'rails_helper'

RSpec.describe Game, type: :model do
  # Adds white pieces to board
  describe 'populate board' do
    it 'Adds correct number of white Pawns to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 6, position_y: 0).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 6, position_y: 1).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 6, position_y: 2).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 6, position_y: 3).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 6, position_y: 4).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 6, position_y: 5).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 6, position_y: 6).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 6, position_y: 7).type).to eq 'Pawn'
    end
  end

  describe 'populate board' do
    it 'Adds white Rook to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 7, position_y: 0).type).to eq 'Rook'
    end
  end

  describe 'populate board' do
    it 'Adds white Rook to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 7, position_y: 7).type).to eq 'Rook'
    end
  end

  describe 'populate board' do
    it 'Adds white Knight to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 7, position_y: 1).type).to eq 'Knight'
    end
  end

  describe 'populate board' do
    it 'Adds white Knight to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 7, position_y: 6).type).to eq 'Knight'
    end
  end

  describe 'populate board' do
    it 'Adds white Bishop to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 7, position_y: 2).type).to eq 'Bishop'
    end
  end

  describe 'populate board' do
    it 'Adds white Bishop to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 7, position_y: 5).type).to eq 'Bishop'
    end
  end

  describe 'populate board' do
    it 'Adds white King to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 7, position_y: 4).type).to eq 'King'
    end
  end

  describe 'populate board' do
    it 'Adds white Queen to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 7, position_y: 3).type).to eq 'Queen'
    end
  end

  # Adds black pieces to board

  describe 'populate board' do
    it 'Adds correct number of black Pawns to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 1, position_y: 0).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 1, position_y: 1).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 1, position_y: 2).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 1, position_y: 3).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 1, position_y: 4).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 1, position_y: 5).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 1, position_y: 6).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 1, position_y: 7).type).to eq 'Pawn'
    end
  end

  describe 'populate board' do
    it 'Adds black Rook to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 0, position_y: 0).type).to eq 'Rook'
    end
  end

  describe 'populate board' do
    it 'Adds black Rook to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 0, position_y: 7).type).to eq 'Rook'
    end
  end

  describe 'populate board' do
    it 'Adds black Knight to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 0, position_y: 1).type).to eq 'Knight'
    end
  end

  describe 'populate board' do
    it 'Adds black Knight to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 0, position_y: 6).type).to eq 'Knight'
    end
  end

  describe 'populate board' do
    it 'Adds black Bishop to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 0, position_y: 2).type).to eq 'Bishop'
    end
  end

  describe 'populate board' do
    it 'Adds black Bishop to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 0, position_y: 5).type).to eq 'Bishop'
    end
  end

  describe 'populate board' do
    it 'Adds black King to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 0, position_y: 4).type).to eq 'King'
    end
  end

  describe 'populate board' do
    it 'Adds black Queen to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 0, position_y: 3).type).to eq 'Queen'
    end
  end

  describe '#check?' do
    it 'returns true if the king is in check' do
      king = King.new(position_x: 4, position_y: 4, color: 'black')
      knight = Knight.new(position_x: 2, position_y: 3, color: 'white')
      expect(knight.valid_move?(king.position_x, king.position_y) && knight.color != king.color).to eq(true)
    end

    it 'returns false if the king is not in check' do
      king = King.new(position_x: 4, position_y: 4, color: 'black')
      knight = Knight.new(position_x: 2, position_y: 3, color: 'black')
      expect(knight.valid_move?(king.position_x, king.position_y) && knight.color != king.color).to eq(true)
    end
  end
end
