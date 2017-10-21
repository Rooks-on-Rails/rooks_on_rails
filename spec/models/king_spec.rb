require 'rails_helper'

RSpec.describe King, type: :model do
  describe '#valid_move' do
    it 'returns true if the move is one space diagonal' do
      king = King.new
      king.position_x = 3
      king.position_y = 3
      expect(king.valid_move?(4, 4)).to eq(true)
    end

    it 'returns true if the move is one space right' do
      king = King.new
      king.position_x = 3
      king.position_y = 3
      expect(king.valid_move?(4, 3)).to eq(true)
    end

    it 'returns true if the move is one space up' do
      king = King.new
      king.position_x = 3
      king.position_y = 3
      expect(king.valid_move?(3, 4)).to eq(true)
    end

    it 'returns true if the move is one space left' do
      king = King.new
      king.position_x = 3
      king.position_y = 3
      expect(king.valid_move?(3, 2)).to eq(true)
    end

    it 'returns true if the move is one space down' do
      king = King.new
      king.position_x = 3
      king.position_y = 3
      expect(king.valid_move?(2, 3)).to eq(true)
    end

    it 'returns false if the move is the same space' do
      king = King.new
      king.position_x = 3
      king.position_y = 3
      expect(king.valid_move?(3, 3)).to eq(false)
    end

    it 'returns false if the move is more than one space' do
      king = King.new
      king.position_x = 3
      king.position_y = 3
      expect(king.valid_move?(5, 3)).to eq(false)
    end

    it 'returns false if the move is off the board' do
      king = King.new
      king.position_x = 0
      king.position_y = 0
      expect(king.valid_move?(-1, -1)).to eq(false)
    end

    it 'returns false if the move is off the board (below zero)' do
      king = King.new
      king.position_x = 0
      king.position_y = 0
      expect(king.valid_move?(-1, -1)).to eq(false)
    end

    it 'returns false if the move is off the board (over seven)' do
      king = King.new
      king.position_x = 7
      king.position_y = 7
      expect(king.valid_move?(8, 8)).to eq(false)
    end
  end
end
