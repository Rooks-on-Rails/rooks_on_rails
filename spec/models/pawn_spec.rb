require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe '#valid_move' do
    it 'returns true if the move is two up from a starting position' do
      pawn = Pawn.new
      pawn.position_x = 3
      pawn.position_y = 1
      expect(pawn.valid_move?(3, 3)).to eq(true)
    end

    it 'returns true if the move is one up from a starting position' do
      pawn = Pawn.new
      pawn.position_x = 3
      pawn.position_y = 1
      expect(pawn.valid_move?(3, 2)).to eq(true)
    end

    it 'returns false if the move is three up from a starting position' do
      pawn = Pawn.new
      pawn.position_x = 3
      pawn.position_y = 1
      expect(pawn.valid_move?(3, 4)).to eq(true)
    end

    it 'returns false if the move is two up not from a starting position' do
      pawn = Pawn.new
      pawn.position_x = 3
      pawn.position_y = 2
      expect(pawn.valid_move?(3, 4)).to eq(true)
    end
  end
end
