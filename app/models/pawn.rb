class Pawn < Piece
  def valid_move?(destination_x, destination_y)
    return false unless destination_x.between?(0, 7) && destination_y.between?(0, 7)

    possible_moves = []

    if color == 'white'
      possible_moves.push([position_x.to_i, position_y.to_i + 1])
      possible_moves.push([position_x.to_i - 1, position_y.to_i + 1])
      possible_moves.push([position_x.to_i + 1, position_y.to_i + 1])
      if position_y == 1
        possible_moves.push([position_x.to_i, position_y.to_i + 2])
      end
    elsif color == 'black'
      possible_moves.push([position_x.to_i, position_y.to_i - 1])
      possible_moves.push([position_x.to_i - 1, position_y.to_i - 1])
      possible_moves.push([position_x.to_i + 1, position_y.to_i - 1])
      if position_y == 6
        possible_moves.push([position_x.to_i, position_y.to_i - 2])
      end
    end

    possible_moves.include?([destination_x.to_i, destination_y.to_i])
  end
end
