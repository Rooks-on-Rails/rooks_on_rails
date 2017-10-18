class Piece < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def icon_path
    "#{color}_#{type}.svg".downcase
  end
end
