require 'rails_helper'

RSpec.describe Piece, type: :model do


  describe '#obstructed?' do
        let(:user) { FactoryGirl.create(:user) }
        let(:game) { FactoryGirl.create(:game) }
        let(:piece) { Rook.create(game: game, user: user, position_x: 0, position_y: 0) }
      context 'invalid move1' do
        it 'should raise an error' do
        result = piece.obstructed?(3,5)
        expect(result).to be(nil)
        end
      end
      context 'invalid move2' do
        it 'should raise an error' do
        #expect { piece.obstructed?(3,5) }.to raise_error('invalid move')
        result = piece.obstructed?(7,2)
        expect(result).to be(nil)
        end
      end
  end


  describe '#obstructed?' do
        let(:user) { FactoryGirl.create(:user) }
        let(:game) { FactoryGirl.create(:game) }
        let(:piece) { Rook.create(game: game, user: user, position_x: 0, position_y: 0) }
    context 'valid move' do
      context 'horizontal move left to right' do
        context 'when piece is not obstructed' do
          it 'should return false' do
            result = piece.obstructed?(7,0)
            #expect(result).to eq('horizontal move')
            expect(result).to be(false)
          end
        end
        context 'when piece is obstructed' do
          before do
            Bishop.create(game: game, user: user, position_x:5, position_y: 0)
          end
          it 'should return true' do
            result = piece.obstructed?(7,0)
            expect(result).to be(true)
          end
        end
      end

      context 'vertical move up' do
        context 'when piece is not obstructed' do
          it 'should return false' do
            result = piece.obstructed?(0,7)
            expect(result).to be(false)
            #expect(result).to eq('vertical move')
          end
        end
        context 'when piece is obstructed' do
            before do
                Bishop.create(game: game, user: user, position_x:0, position_y: 2)
            end
            it 'should return true' do
              result = piece.obstructed?(0,7)
              expect(result).to be(true)
            end
        end
      end

      context 'diagonal move up' do
          context 'when piece is not obstructed' do
            it 'should return false' do
              result = piece.obstructed?(5,5)
              expect(result).to be(false)
               #expect(result).to eq('diagonal move')
            end
          end
          context 'when piece is obstructed' do
              before do
                  Queen.create(game: game, user: user, position_x:1, position_y: 1)
              end
              it 'should return true' do
                result = piece.obstructed?(5,5)
                expect(result).to be(true)
              end
          end
      end
    end
  end


        describe '#obstructed?' do
              let(:user) { FactoryGirl.create(:user) }
              let(:game) { FactoryGirl.create(:game) }
              let(:piece) { Queen.create(game: game, user: user, position_x: 4, position_y: 4) }
          context 'valid move' do
            context 'horizontal move right to left' do
              context 'when piece is not obstructed' do
                it 'should return false' do
                  result = piece.obstructed?(0,4)
                  expect(result).to be(false)
                end
              end
              context 'when piece is obstructed' do
                before do
                  Bishop.create(game: game, user: user, position_x: 2, position_y: 4)
                end
                it 'should return true' do
                  result = piece.obstructed?(0,4)
                  expect(result).to be(true)
                end
              end
            end

            context 'vertical move down' do
              context 'when piece is not obstructed' do
                it 'should return false' do
                  result = piece.obstructed?(4,0)
                  expect(result).to be(false)
                end
              end
              context 'when piece is obstructed' do
                  before do
                      Bishop.create(game: game, user: user, position_x:4, position_y: 1)
                  end
                  it 'should return true' do
                    result = piece.obstructed?(4,0)
                    expect(result).to be(true)
                  end
              end
            end

            context 'diagonal move down' do
                context 'when piece is not obstructed' do
                  it 'should return false' do
                    result = piece.obstructed?(0,0)
                    expect(result).to be(false)
                     #expect(result).to eq('diagonal move')
                  end
                end
                context 'when piece is obstructed' do
                    before do
                        Rook.create(game: game, user: user, position_x:3, position_y: 3)
                    end
                    it 'should return true' do
                      result = piece.obstructed?(0,0)
                      expect(result).to be(true)
                    end
                end
            end
          end
        end

end
