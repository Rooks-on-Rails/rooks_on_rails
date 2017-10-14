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
    let(:piece) { FactoryGirl.create(:bishop) }
    #let(:piece) { Bishop.create(position_x: 0, position_y: 0) }

    context 'when horizontal move' do
      context 'when piece is obstructed' do
        before { FactoryGirl.create(:bishop, position_x: 4, position_y: 0) }


        it 'should return true' do
          result = piece.obstructed?(7, 0)

            # create piece for testing
            # call the obstructed?
            # get the result

          expect(result).to be(true)
        end
      end

      context 'when piece is not obstructed' do
        it 'should return false' do
          result = piece.obstructed?
          expect(result).to be(false)
        end
      end
    end
  end
end
