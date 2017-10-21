class Knight < Piece
  def valid_move?(destination_x, destination_y)
    return false unless destination_x.between?(0, 7) && destination_y.between?(0, 7)
    difference_x = destination_x - position_x
    difference_y = destination_y - position_y
    if difference_x.abs == 1 && difference_y.abs == 2
      return true
    elsif difference_x.abs == 2 && difference_y.abs == 1
      return true
    else
      return false
    end
  end
end
