class Piece < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def obstructed?(type, position_x, position_y)
  
    # see if the destination is a valid ie
    # diagonal, vertical or horizontal
    # return boolean (true if move valid, else false)

    #the two lines below are just included for now
    #until I can see where the start postion of the piece is
    piece_start_x_position = startx
    piece_start_y_position = starty


      x_diff = piece_start_x_position - position_x
      y_diff = piece_start_y_position - position_y


      if (x_diff.abs == y_diff.abs || x_diff == 0 || y_diff == 0) == true
        //ie a valid move
        return true
      else
        // ie not a valid move
        return false
      end

    # need method to do the following:
    # get all the coordinates between the current piece and its destination
    # get coordinates of the pieces on the board
    # compare the two
    # true if obstruction present
    # false if no obstruction present
    # if destination is not diagonal, vertical or horizontal to start then return
    # an error message, ie move not valid




  end

end
