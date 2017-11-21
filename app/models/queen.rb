class Queen < Piece
  def valid_move?(destination_x, destination_y)
    return false unless destination_x.between?(0, 7) && destination_y.between?(0, 7)
    difference_x = destination_x - position_x
    difference_y = destination_y - position_y
    return false if difference_x.zero? && difference_y.zero?
    difference_x.abs <= 7 && difference_y.abs <= 7
  end
end
