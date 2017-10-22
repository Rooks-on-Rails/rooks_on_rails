require 'rails_helper'

RSpec.describe Queen, type: :model do
  describe '#valid_move' do
    it 'returns true if the move is one space down' do
      queen = Queen.new
      queen.position_x = 0
      queen.position_y = 3
      expect(queen.valid_move?(1, 3)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is four spaces down' do
      queen = Queen.new
      queen.position_x = 0
      queen.position_y = 3
      expect(queen.valid_move?(4, 3)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is eight spaces down (off board)' do
      queen = Queen.new
      queen.position_x = 0
      queen.position_y = 3
      expect(queen.valid_move?(8, 3)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is one space up (off board)' do
      queen = Queen.new
      queen.position_x = 7
      queen.position_y = 3
      expect(queen.valid_move?(8, 3)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is one space left' do
      queen = Queen.new
      queen.position_x = 0
      queen.position_y = 3
      expect(queen.valid_move?(0, 2)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is three spaces left' do
      queen = Queen.new
      queen.position_x = 0
      queen.position_y = 3
      expect(queen.valid_move?(0, 0)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is four spaces left (off board)' do
      queen = Queen.new
      queen.position_x = 0
      queen.position_y = 3
      expect(queen.valid_move?(0, -1)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is one space right' do
      queen = Queen.new
      queen.position_x = 0
      queen.position_y = 3
      expect(queen.valid_move?(0, 4)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is four spaces right' do
      queen = Queen.new
      queen.position_x = 0
      queen.position_y = 3
      expect(queen.valid_move?(0, 7)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is five spaces right (off board)' do
      queen = Queen.new
      queen.position_x = 0
      queen.position_y = 3
      expect(queen.valid_move?(0, 8)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is one space up' do
      queen = Queen.new
      queen.position_x = 7
      queen.position_y = 3
      expect(queen.valid_move?(6, 3)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is three spaces up' do
      queen = Queen.new
      queen.position_x = 7
      queen.position_y = 3
      expect(queen.valid_move?(4, 3)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is eight spaces up (off board)' do
      queen = Queen.new
      queen.position_x = 7
      queen.position_y = 3
      expect(queen.valid_move?(-1, 3)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is one space up (off board)' do
      queen = Queen.new
      queen.position_x = 0
      queen.position_y = 3
      expect(queen.valid_move?(-1, 3)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is one space down from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(5, 4)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is three spaces down from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(7, 4)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is five spaces down from middle of board (off board)' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(9, 4)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is one space left from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(4, 3)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is three spaces left from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(4, 1)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is five spaces left from middle of board (off board)' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(4, -1)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is one space right from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(4, 5)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is three spaces right from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(4, 7)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is five spaces right from middle of board (off board)' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(4, 9)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is one space up from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(3, 4)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is three spaces up from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(1, 4)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is five spaces up from middle of board (off board)' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(-1, 4)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is one space diagonally up-right from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(3, 5)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is three spaces diagonally up-right from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(1, 7)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is five spaces diagonally up-right from middle of board (off board)' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(-1, 9)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is one space diagonally up-left from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(3, 3)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is three spaces diagonally up-left from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(1, 1)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is five spaces diagonally up-left from middle of board (off board)' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(-1, -1)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is one space diagonally down-left from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(5, 3)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is three spaces diagonally down-left from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(7, 1)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is five spaces diagonally down-left from middle of board (off board)' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(9, -1)).to eq(false)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is one space diagonally down-right from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(5, 5)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns true if the move is three spaces diagonally down-right from middle of board' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(7, 7)).to eq(true)
    end
  end

  describe '#valid_move' do
    it 'returns false if the move is five spaces diagonally down-right from middle of board (off board)' do
      queen = Queen.new
      queen.position_x = 4
      queen.position_y = 4
      expect(queen.valid_move?(9, 9)).to eq(false)
    end
  end
end