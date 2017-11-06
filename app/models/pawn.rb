class Pawn < Piece

    INITIAL_WHITE_PAWN_LOCATIONS = [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6] [1, 7]]
    INITIAL_BLACK_PAWN_LOCATIONS = [[6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6] [6, 7]]

    # def move(destination_x, destination_y)
    #   if valid_move?(destination_x, destination_y)
    #     Piece.update(position_x: destination_x, position_y: destination_y)
    #     true
    #   else
    #     false
    #   end
    # end

    def initial_pawn_location?
        if self.color == 'white'
          INITIAL_WHITE_PAWN_LOCATIONS.include?([self.position_x, self.position_y])
        else
          INITIAL_BLACK_PAWN_LOCATIONS.include?([self.position_x, self.position_y])
        end
    end

    def white_moving
      color
    end

    def horizontal_move?(h)
       difference_x = (position_x - h).abs
       difference_x != 0
    end

    def backwards_move?(b)
       color ? position_y > b : position_y < destination_y
    end

    def initial_move(destination_x, destination_y)
      if white_moving
        position_y == 1 && destination_x == position_x && destination_y == position_y + 2
      else
        position_y == 6 && destination_x == position_x && destination_y == position_y - 2
      end
    end

    def move(destination_x, destination_y)
      if white_moving
        destination_x == position_x && destination_y == position_y + 1
      else
        destination_x == position_x && destiatnion_y == position_y - 1
      end
    end

    def valid_move?(destination_x, destination_y)
       return false if is_obstructed?(destination_x, destination_y)
       return false if backwards_move?(destination_y)
       return false if horizontal_move?(destination_x)
       return true if initial_move #need to add argument
       return true if move #need to add argument
    end

end 
