class Pawn < Piece
  def valid_move?(destination_x, destination_y)
    return false unless destination_x.between?(0, 7) && destination_y.between?(0, 7)
    # return false if is_obstructed?(destination_x, destination_y)
    # include the above line once that method is added to the piece model

    possible_moves = []

    if color == 'white'
      possible_moves << [position_x.to_i, position_y.to_i + 1]
      if position_y = 1
        possible_moves << [position_x.to_i, position_y.to_i + 2]
      end
    elsif color == 'black'
      possible_moves << [position_x.to_i, position_y.to_i - 1]
      if position_y = 6
        possible_moves << [position_x.to_i, position_y.to_i - 2]
      end
    end

    destination_piece = Piece.find_by(position_x: destination_x, position_y: destination_y)

    if destination_piece.present?
      if destination_piece.color == color
        possible_moves.delete(destination_x, destination_y)
      elsif destination_piece.color != color
        if ! forward_diagonal_move?(destination_x, destination_y)
          possible_moves.delete(destination_x, destination_y)
        elsif forward_diagonal_move?(destination_x, destination_y)
          if color == 'white'
            possible_moves << [position_x.to_i - 1, position_y.to_i + 1] << [position_x.to_i + 1, position_y.to_i + 1]
          elsif color == 'black'
            possible_moves << [position_x.to_i - 1, position_y.to_i - 1] << [position_x.to_i + 1, position_y.to_i - 1]
          end
        end
      end
    end

    if possible_moves.include?([destination_x, destination_y])
      return true
    end

    false
  end

  def forward_diagonal_move?
    difference_x = destination_x - position_x
    difference_y = destination_y - position_y

    return true if color == 'white' && difference_x = 1 && difference_y.abs = 1
    return true if color == 'black' && difference_x = -1 && difference_y.abs = 1

    false
  end
end
