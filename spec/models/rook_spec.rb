require 'rails_helper'

RSpec.describe Rook, type: :model do
  describe '#valid_move' do
    it 'returns true if the move is one space right' do
      rook = Rook.new
      rook.position_x = 0
      rook.position_y = 0
      expect(rook.valid_move?(1, 0)).to eq(true)
    end

    it 'returns true if the move is one space up' do
      rook = Rook.new
      rook.position_x = 0
      rook.position_y = 0
      expect(rook.valid_move?(0, 1)).to eq(true)
    end

    it 'returns true if the move is one space left' do
      rook = Rook.new
      rook.position_x = 3
      rook.position_y = 3
      expect(rook.valid_move?(2, 3)).to eq(true)
    end

    it 'returns true if the move is one space down' do
      rook = Rook.new
      rook.position_x = 3
      rook.position_y = 3
      expect(rook.valid_move?(3, 2)).to eq(true)
    end

    it 'returns true if the move is several spaces right' do
      rook = Rook.new
      rook.position_x = 0
      rook.position_y = 3
      expect(rook.valid_move?(4, 3)).to eq(true)
    end

    it 'returns true if the move is several spaces left' do
      rook = Rook.new
      rook.position_x = 7
      rook.position_y = 4
      expect(rook.valid_move?(1, 4)).to eq(true)
    end

    it 'returns true if the move is several spaces up' do
      rook = Rook.new
      rook.position_x = 0
      rook.position_y = 0
      expect(rook.valid_move?(0, 5)).to eq(true)
    end

    it 'returns true if the move is several spaces down' do
      rook = Rook.new
      rook.position_x = 0
      rook.position_y = 7
      expect(rook.valid_move?(0, 3)).to eq(true)
    end

    it 'returns false if the move is the same space' do
      rook = Rook.new
      rook.position_x = 3
      rook.position_y = 3
      expect(rook.valid_move?(3, 3)).to eq(false)
    end

    it 'returns false if the move is off the board (below zero)' do
      rook = Rook.new
      rook.position_x = 0
      rook.position_y = 0
      expect(rook.valid_move?(-1, -1)).to eq(false)
    end

    it 'returns false if the move is off the board (over seven)' do
      rook = Rook.new
      rook.position_x = 7
      rook.position_y = 7
      expect(rook.valid_move?(8, 8)).to eq(false)
    end

    it 'retrns false if the move is diagonal' do
      rook = Rook.new
      rook.position_x = 0
      rook.position_y = 0
      expect(rook.valid_move?(1, 1)).to eq(false)
    end
  end
end
