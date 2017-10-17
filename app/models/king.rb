class King < Piece
  def valid_move?(destination_x, destination_y)
    if destination_x.between?(0, 7) && destination_y.between?(0, 7)
      difference_x = destination_x - position_x
      difference_y = destination_y - position_y

      return true if difference_x.abs == 1 || difference_y.abs == 1
    end
    false
  end
end
