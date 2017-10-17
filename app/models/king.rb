class King < Piece
  def valid_move?(destination_x, destination_y)
    difference_x = destination_x - position_x
    difference_y = destination_y - position_y

    return true if difference_x.abs == 1 || difference_y.abs == 1
    false
  end
end
