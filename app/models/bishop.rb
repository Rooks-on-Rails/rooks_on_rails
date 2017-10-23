class Bishop < Piece
  def valid_move?(destination_x, destination_y)
    return false unless destination_x.between?(0, 7) && destination_y.between?(0, 7)
    the_same_location = destination_x == position_x && destination_y == position_y
    in_a_diagonal_direction = destination_x != position_x && destination_y != position_y
    return true if the_same_location == false && in_a_diagonal_direction == true
    false
  end
end
