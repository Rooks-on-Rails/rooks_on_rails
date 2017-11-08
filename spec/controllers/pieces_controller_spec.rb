require 'rails_helper'

RSpec.describe PiecesControllerSpec, type: :controller do
   # arrange
   # white_piece = Piece.new(...)
   black_piece = Pawn.create(position_x: 1, position_y: 0)
   destination_x = 2
   destination_y = 0
   # act
   black_piece.move(destination_x, destination_y)
   # assert
   expect([black_piece.position_x, black_piece.position_y]).to eq([destination_x, destination_y])
 end
