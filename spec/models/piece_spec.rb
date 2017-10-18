require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe '#move_to!' do
    let(:game) { Game.create! }
    let(:user) { User.create!(email: 'dude@abides.com', password: 'thatsyouropinionman') }
    let(:piece) { Piece.create!(position_x: 0, position_y: 0, game: game, user: user) }
    it 'should be able to move there' do
      piece.move_to!(0, 1)

      expect(piece.position_y).to eq(1)
    end

    pending 'should be able to capture opposing piece' do
      user2 = User.create!(email: 'no@way.com', password: 'Nopenoteven')
      opposing_piece = Piece.create!(position_x: 0, position_y: 1, game: game, user: user2)
      piece.move_to!(0, 1)

      expect(piece.position_y).to eq(1)
      expect(opposing_piece.position_y).to be_nil
      expect(opposing_piece.position_x).to be_nil
    end

    it 'should update position to new location' do
      piece.move_to!(1, 1)

      expect(piece.position_x).to eq(1)
      expect(piece.position_y).to eq(1)
    end
  end
end
