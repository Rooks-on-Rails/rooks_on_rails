class Piece < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def obstructed?(end_position_x, end_position_y)


    # see if the destination is a valid ie
    # diagonal, vertical or horizontal
    # return boolean (true if move valid, else false)

    #the two lines below are just included for now
    #until I can see where the start postion of the piece is

      x_diff = position_x - end_position_x
      y_diff = position_y - end_position_y

      raise 'invalid move' unless (x_diff.abs == y_diff.abs || x_diff == 0 || y_diff == 0)
        #ie a valid move

        # if move is valid then run commands below
        position_range_x = [(position_x + 1)..(end_position_x - 1)]
        horizontal_obstructing_pieces = Piece.where(game_id: game_id, position_x: position_range_x, position_y: position_y)

        position_range_y = [(position_y + 1)..(end_position_y - 1)]

        vertical_obstructing_pieces = Piece.where(game_id: game_id, position_x: position_x, position_y: position_range_y)

        if horizontal_obstructing_pieces.empty? && vertical_obstructing_pieces.empty?
          #empty
          # ie move is valid and no obstruction
          false
        else
            #not empty
          true
        end
  end

end
