class Piece < ApplicationRecord
  belongs_to :game

  def move_to!(x, y)
    opposing_piece = game.pieces.find_by(position_x: x, position_y: y)

    if opposing_piece.present? && opposing_piece.color != color
      opposing_piece.update_attributes(position_x: nil, position_y: nil)
      update_attributes(position_x: x, position_y: y)
    elsif opposing_piece.present? == false
      update_attributes(position_x: x, position_y: y)
    else
      return 'invalid move'
    end
  end
end
