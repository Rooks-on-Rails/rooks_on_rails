class King < Piece
  def valid_move?(destination_x, destination_y)
    difference_x = destination_x - self.position_x
    difference_y = destination_y - self.position_y

    if difference_x.abs <= 1 && difference_y.abs <= 1
      return true
    end
    false
  end
end
