class Pawn < Piece
  def valid_move?(destination_x, destination_y)
    return false unless destination_x.between?(0, 7) && destination_y.between?(0, 7)
    # return false if is_obstructed?(destination_x, destination_y)
    # include the above line once that method is added to the piece model

    possible_moves = []

    if color == 'white'
      possible_moves << [position_x.to_i, (position_y.to_i + 1)]
      if position_y = 1
        possible_moves << [position_x.to_i, (position_y.to_i + 2)]
      end
    end

    if color == 'black'
      possible_moves << [position_x.to_i, (position_y.to_i - 1)]
      if position_y = 6
        possible_moves << [position_x.to_i, (position_y.to_i - 2)]
      end
    end

    if possible_moves.include?([destination_x, destination_y])
      return true
    end

    false
  end
end
