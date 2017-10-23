
require 'rails_helper'

RSpec.describe Bishop, type: :model do
  describe '#valid_move?' do
    let(:game) { Game.create! }
    let(:user) { User.create!(email: 'dude@abides.com', password: 'thatsyouropinionman') }
    let(:bishop) { Bishop.create!(position_x: 2, position_y: 0, game: game, color: 'white') }

    it 'returns true if moves are diagonal' do
      expect(bishop.valid_move?(3, 1)).to eq(true)
      expect(bishop.valid_move?(7, 5)).to eq(true)
    end

    it "shouldn't allow you to move in a straight direction" do
      bishop.reload
      expect(bishop.valid_move?(1, 0)).to eq(false)
      expect(bishop.valid_move?(2, 1)).to eq(false)
    end

    it "shouldn't allow you to move off the board" do
      bishop.reload
      expect(bishop.valid_move?(6, 8)). to eq(false)
      expect(bishop.valid_move?(-1, 3)). to eq(false)
    end
  end
end
