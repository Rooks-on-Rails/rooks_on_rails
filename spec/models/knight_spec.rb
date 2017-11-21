require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe '#valid_move' do
    it 'returns true if the move is one right, two up' do
      knight = Knight.new
      knight.position_x = 3
      knight.position_y = 3
      expect(knight.valid_move?(4, 5)).to eq(true)
    end

    it 'returns true if the move is two right, one up' do
      knight = Knight.new
      knight.position_x = 3
      knight.position_y = 3
      expect(knight.valid_move?(5, 4)).to eq(true)
    end

    it 'returns true if the move is two right, one down' do
      knight = Knight.new
      knight.position_x = 3
      knight.position_y = 3
      expect(knight.valid_move?(5, 2)).to eq(true)
    end

    it 'returns true if the move is one right, two down' do
      knight = Knight.new
      knight.position_x = 3
      knight.position_y = 3
      expect(knight.valid_move?(4, 1)).to eq(true)
    end

    it 'returns true if the move is one left, two up' do
      knight = Knight.new
      knight.position_x = 3
      knight.position_y = 3
      expect(knight.valid_move?(2, 5)).to eq(true)
    end

    it 'returns true if the move is two left, one up' do
      knight = Knight.new
      knight.position_x = 3
      knight.position_y = 3
      expect(knight.valid_move?(1, 4)).to eq(true)
    end

    it 'returns true if the move is two left, one down' do
      knight = Knight.new
      knight.position_x = 3
      knight.position_y = 3
      expect(knight.valid_move?(1, 2)).to eq(true)
    end

    it 'returns true if the move is one left, two down' do
      knight = Knight.new
      knight.position_x = 3
      knight.position_y = 3
      expect(knight.valid_move?(2, 1)).to eq(true)
    end

    it 'returns false if the move is a knight move but off the board (below zero)' do
      knight = Knight.new
      knight.position_x = 0
      knight.position_y = 0
      expect(knight.valid_move?(-1, -2)).to eq(false)
    end

    it 'returns false if the move is a knight move off the board (over seven)' do
      knight = Knight.new
      knight.position_x = 7
      knight.position_y = 7
      expect(knight.valid_move?(9, 8)).to eq(false)
    end

    it 'returns false if the move is the same space' do
      knight = Knight.new
      knight.position_x = 3
      knight.position_y = 3
      expect(knight.valid_move?(3, 3)).to eq(false)
    end

    it 'returns false if the move is only one direction' do
      knight = Knight.new
      knight.position_x = 3
      knight.position_y = 3
      expect(knight.valid_move?(6, 3)).to eq(false)
    end

    it 'returns false if the move if two spaces in two directions' do
      knight = Knight.new
      knight.position_x = 3
      knight.position_y = 3
      expect(knight.valid_move?(5, 5)).to eq(false)
    end
  end
end
