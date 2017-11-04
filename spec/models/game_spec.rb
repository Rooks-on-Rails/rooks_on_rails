require 'rails_helper'

RSpec.describe Game, type: :model do
  # Adds white pieces to board
  describe 'populate board' do
    it 'Adds correct number of white Pawns to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 0, position_y: 1).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 1, position_y: 1).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 2, position_y: 1).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 3, position_y: 1).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 4, position_y: 1).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 5, position_y: 1).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 6, position_y: 1).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 7, position_y: 1).type).to eq 'Pawn'
    end
  end

  describe 'populate board' do
    it 'Adds white Rook to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 0, position_y: 0).type).to eq 'Rook'
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
    it 'Adds white Knight to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 1, position_y: 0).type).to eq 'Knight'
    end
  end

  describe 'populate board' do
    it 'Adds white Knight to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 6, position_y: 0).type).to eq 'Knight'
    end
  end

  describe 'populate board' do
    it 'Adds white Bishop to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 2, position_y: 0).type).to eq 'Bishop'
    end
  end

  describe 'populate board' do
    it 'Adds white Bishop to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 5, position_y: 0).type).to eq 'Bishop'
    end
  end

  describe 'populate board' do
    it 'Adds white King to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 4, position_y: 0).type).to eq 'King'
    end
  end

  describe 'populate board' do
    it 'Adds white Queen to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 3, position_y: 0).type).to eq 'Queen'
    end
  end

  # Adds black pieces to board

  describe 'populate board' do
    it 'Adds correct number of black Pawns to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 0, position_y: 6).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 1, position_y: 6).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 2, position_y: 6).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 3, position_y: 6).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 4, position_y: 6).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 5, position_y: 6).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 6, position_y: 6).type).to eq 'Pawn'
      expect(game.pieces.find_by(position_x: 7, position_y: 6).type).to eq 'Pawn'
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
    it 'Adds black Rook to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 7, position_y: 7).type).to eq 'Rook'
    end
  end

  describe 'populate board' do
    it 'Adds black Knight to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 1, position_y: 7).type).to eq 'Knight'
    end
  end

  describe 'populate board' do
    it 'Adds black Knight to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 6, position_y: 7).type).to eq 'Knight'
    end
  end

  describe 'populate board' do
    it 'Adds black Bishop to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 2, position_y: 7).type).to eq 'Bishop'
    end
  end

  describe 'populate board' do
    it 'Adds black Bishop to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 5, position_y: 7).type).to eq 'Bishop'
    end
  end

  describe 'populate board' do
    it 'Adds black King to the board' do
      game = Game.create!
      game.populate_board!

      expect(game.pieces.find_by(position_x: 4, position_y: 7).type).to eq 'King'
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
    it 'returns true if the king is in check by knight' do
      game = Game.create
      game.populate_board!
      king = King.find_by(color: 'black', game: game)
      king.update_attributes(position_y: 3)
      knight = Knight.find_by(position_x: 1, position_y: 0)
      knight.update_attributes(position_x: 2, position_y: 2)
      expect(game.check?).to eq(true)
    end

    it 'returns false if the king is not in check by knight' do
      game = Game.create
      game.populate_board!
      king = King.find_by(color: 'black', game: game)
      king.update_attributes(position_y: 3)
      knight = Knight.find_by(position_x: 1, position_y: 0)
      knight.update_attributes(position_x: 0, position_y: 2)
      expect(game.check?).to eq(false)
    end

    it 'returns true if the king is in check by pawn' do
      game = Game.create
      game.populate_board!
      king = King.find_by(color: 'black', game: game)
      king.update_attributes(position_x: 2, position_y: 5)
      pawn = Pawn.find_by(position_x: 1, position_y: 1)
      pawn.update_attributes(position_x: 1, position_y: 4)
      expect(game.check?).to eq(true)
    end

    it 'returns false if the king is not in check by pawn' do
      game = Game.create
      game.populate_board!
      king = King.find_by(color: 'black', game: game)
      king.update_attributes(position_x: 2, position_y: 5)
      pawn = Pawn.find_by(position_x: 1, position_y: 1)
      pawn.update_attributes(position_x: 1, position_y: 2)
      expect(game.check?).to eq(false)
    end

    it 'returns true if the king is in check by rook' do
      game = Game.create
      game.populate_board!
      king = King.find_by(color: 'black', game: game)
      king.update_attributes(position_x: 0, position_y: 5)
      rook = Rook.find_by(position_x: 0, position_y: 0)
      rook.update_attributes(position_x: 0, position_y: 2)
      expect(game.check?).to eq(true)
    end

    it 'returns false if the king is not in check by rook' do
      game = Game.create
      game.populate_board!
      king = King.find_by(color: 'black', game: game)
      king.update_attributes(position_x: 1, position_y: 5)
      rook = Rook.find_by(position_x: 0, position_y: 0)
      rook.update_attributes(position_x: 0, position_y: 2)
      expect(game.check?).to eq(false)
    end

    it 'returns true if the king is in check by queen' do
      game = Game.create
      game.populate_board!
      king = King.find_by(color: 'black', game: game)
      king.update_attributes(position_x: 4, position_y: 5)
      queen = Queen.find_by(color: 'white')
      queen.update_attributes(position_x: 2, position_y: 3)
      expect(game.check?).to eq(true)
    end

    it 'returns false if the king is not in check by queen' do
      game = Game.create
      game.populate_board!
      king = King.find_by(color: 'black', game: game)
      king.update_attributes(position_x: 6, position_y: 5)
      queen = Queen.find_by(color: 'white')
      queen.update_attributes(position_x: 2, position_y: 3)
      expect(game.check?).to eq(false)
    end

    it 'returns true if the king is in check by bishop' do
      game = Game.create
      game.populate_board!
      king = King.find_by(color: 'black', game: game)
      king.update_attributes(position_x: 3, position_y: 5)
      bishop = Bishop.find_by(position_x: 2, position_y: 0)
      bishop.update_attributes(position_x: 0, position_y: 2)
      expect(game.check?).to eq(true)
    end

    it 'returns false if the king is not in check by bishop' do
      game = Game.create
      game.populate_board!
      king = King.find_by(color: 'black', game: game)
      king.update_attributes(position_x: 4, position_y: 5)
      bishop = Bishop.find_by(position_x: 2, position_y: 0)
      bishop.update_attributes(position_x: 0, position_y: 2)
      expect(game.check?).to eq(true)
    end
  end
end
