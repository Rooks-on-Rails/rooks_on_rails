require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe '#valid_move' do
    it 'returns true if the move is two forwards from a starting position (white)' do
      pawn = Pawn.new(color: 'white', position_x: 3, position_y: 1)
      expect(pawn.valid_move?(3, 3)).to eq(true)
    end

    it 'returns true if the move is one forwards from a starting position (white)' do
      pawn = Pawn.new(color: 'white', position_x: 3, position_y: 1)
      expect(pawn.valid_move?(3, 2)).to eq(true)
    end

    it 'returns false if the move is three forwards from a starting position (white)' do
      pawn = Pawn.new(color: 'white', position_x: 3, position_y: 1)
      expect(pawn.valid_move?(3, 4)).to eq(false)
    end

    it 'returns false if the move is two forwards not from a starting position (white)' do
      pawn = Pawn.new(color: 'white', position_x: 3, position_y: 2)
      expect(pawn.valid_move?(3, 4)).to eq(false)
    end

    it 'returns false if the move is one left' do
      pawn = Pawn.new(position_x: 3, position_y: 2)
      expect(pawn.valid_move?(2, 2)).to eq(false)
    end

    it 'returns false if the move is one right' do
      pawn = Pawn.new(position_x: 3, position_y: 2)
      expect(pawn.valid_move?(4, 2)).to eq(false)
    end

    it 'returns false if the move is one backwards (white)' do
      pawn = Pawn.new(color: 'white', position_x: 3, position_y: 3)
      expect(pawn.valid_move?(3, 2)).to eq(false)
    end

    it 'returns true if the move is forwards diagonal (white)' do
      pawn = Pawn.new(color: 'white', position_x: 3, position_y: 2)
      expect(pawn.valid_move?(4, 3)).to eq(true)
    end

    it 'returns false if the move is backwards diagonal (white)' do
      pawn = Pawn.new(color: 'white', position_x: 3, position_y: 3)
      expect(pawn.valid_move?(4, 2)).to eq(false)
    end

    it 'returns true if the move is two forwards from a starting position (black)' do
      pawn = Pawn.new(color: 'black', position_x: 3, position_y: 6)
      expect(pawn.valid_move?(3, 4)).to eq(true)
    end

    it 'returns true if the move is one forwards from a starting position (black)' do
      pawn = Pawn.new(color: 'black', position_x: 3, position_y: 6)
      expect(pawn.valid_move?(3, 5)).to eq(true)
    end

    it 'returns false if the move is three forwards from a starting position (black)' do
      pawn = Pawn.new(color: 'black', position_x: 3, position_y: 6)
      expect(pawn.valid_move?(3, 3)).to eq(false)
    end

    it 'returns false if the move is two forwards not from a starting position (black)' do
      pawn = Pawn.new(color: 'black', position_x: 3, position_y: 5)
      expect(pawn.valid_move?(3, 3)).to eq(false)
    end

    it 'returns false if the move is one backwards (black)' do
      pawn = Pawn.new(color: 'black', position_x: 3, position_y: 4)
      expect(pawn.valid_move?(3, 5)).to eq(false)
    end

    it 'returns true if the move is forwards diagonal (black)' do
      pawn = Pawn.new(color: 'black', position_x: 3, position_y: 6)
      expect(pawn.valid_move?(4, 5)).to eq(true)
    end

    it 'returns false if the move is backwards diagonal (black)' do
      pawn = Pawn.new(color: 'black', position_x: 3, position_y: 4)
      expect(pawn.valid_move?(4, 5)).to eq(false)
    end
  end
end
