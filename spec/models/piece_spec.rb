require 'rails_helper'

RSpec.describe Piece, type: :model do

  # describe '#who_am_i' do
  #   context 'any piece' do
  #     let(:piece) { Piece.create }
  #
  #     it 'should return a string' do
  #       result = piece.who_am_i
  #       expect(result).to eq 'I am a piece'
  #     end
  #
  #     it 'should not return empty string' do
  #       result = piece.who_am_i
  #       expect(result).not_to eq ''
  #     end
  #   end
  # end



  describe '#obstructed?' do
    let(:user) { FactoryGirl.create(:user) }
    let(:game) { FactoryGirl.create(:game) }
let(:piece) { Rook.create(game: game, user: user, position_x: 0, position_y: 0) }
    context 'invalid move' do
      it 'should raise an error' do
        expect { piece.obstructed?(3,5) }.to raise_error('invalid move')
      end
    end

    context 'valid move' do
      context 'horizontal move' do
        context 'when piece is not obstructed' do
          it 'should return false' do
            result = piece.obstructed?(7,0)
            expect(result).to be(false)
          end
        end
        context 'when piece is obstructed' do
          before do
            Bishop.create(game: game, user: user, position_x: 2, position_y: 0)
          end

          it 'should return true' do
            result = piece.obstructed?(5,0)
            expect(result).to be(true)
          end

        end
      end
      context 'vertical move' do
        context 'when piece is not obstructed' do
          it 'should return false' do
            result = piece.obstructed?(0,7)
            expect(result).to be(false)
          end
        end
        context 'when piece is obstructed' do
          before do
            Bishop.create(game: game, user: user, position_x: 0, position_y: 4)
          end

          it 'should return true' do
            result = piece.obstructed?(0,5)
            expect(result).to be(true)
          end

        end
      end





    end
  end
end
