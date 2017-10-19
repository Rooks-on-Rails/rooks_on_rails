class Piece < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def icon_path
    "#{color}_#{type}.svg".downcase
  end

  def move_to!(x, y)
    piece = Piece.find_by(position_x: x, position_y: y)

    if piece.present? && piece.color != color
      piece.update_attributes(position_x: nil, position_y: nil)
    elsif piece.present? == false
      update_attributes(position_x: x, position_y: y)
    else
      return 'invalid move'
    end
  end
end
