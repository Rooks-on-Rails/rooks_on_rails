require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe '#move_to!' do
    let(:game) { Game.create! }
    let(:user) { User.create!(email: 'dude@abides.com', password: 'thatsyouropinionman') }
    let(:piece) { Piece.create!(position_x: 0, position_y: 0, game: game, user: user, color: 'white') }
    it 'should be able to move there' do
      piece.move_to!(1, 1)

      expect(piece.position_y).to eq(1)
    end

    it 'should be able to capture opposing piece' do
      user2 = User.create!(email: 'no@way.com', password: 'Nopenoteven')
      opposing_piece = Piece.create!(position_x: 0, position_y: 1, game: game, user: user2, color: 'black')

      piece.move_to!(0, 1)
      opposing_piece.reload
      expect(piece.position_y).to eq(1)
      expect(opposing_piece.position_y).to be_nil
      expect(opposing_piece.position_x).to be_nil
    end

    it 'should update position to new location' do
      piece.move_to!(2, 2)

      expect(piece.position_x).to eq(2)
      expect(piece.position_y).to eq(2)
    end

    it "Shouldn't allow you to move to a place where another of your pieces is" do
      same_color_piece = Piece.create!(position_x: 0, position_y: 1, game: game, user: user, color: 'white')
      piece.move_to!(0, 1)

      expect(same_color_piece.position_y).to eq(1)
      expect(piece.position_x).to eq(0)
      expect(piece.position_y).to eq(0)
    end
  end
end
