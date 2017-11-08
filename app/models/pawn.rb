class Pawn < Piece
  initial_white_pawn_locations = [[0, 1], [1, 1], [2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1]]
  initial_black_pawn_locations = [[0, 6], [1, 6], [2, 6], [3, 6], [4, 6], [5, 6], [6, 6], [7, 6]]

  def initial_pawn_location?
    if self.color == 'white'
      initial_white_pawn_locations.include?([self.position_x, self.position_y])
    else
      initial_black_pawn_locations.include?([self.position_x, self.position_y)
    end
  end

  def valid_move?(destination_x, destination_y)
    return false unless destination_x.between?(0, 7) && destination_y.between?(0, 7)
    return false if is_obstructed?(destination_x, destination_y)
    difference_x = destination_x - position_x
    difference_y = destination_y - position_y
  end
end
