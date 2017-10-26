require 'rails_helper'

RSpec.describe Game, type: :model do
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
