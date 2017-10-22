class Piece < ApplicationRecord
  belongs_to :game

  def icon_path
    "#{color}_#{type}.svg".downcase
  end
end
