class Pawn < Piece

    INITIAL_WHITE_PAWN_LOCATIONS = [[x1, y0], [x1, y1], [x1, y2], [x1, y3], [x1, y4], [x1, y5], [x1, y6] [x1, y7]]
    INITIAL_BLACK_PAWN_LOCATIONS = [[x6, y0], [x6, y1], [x6, y2], [x6, y3], [x6, y4], [x6, y5], [x6, y6] [x6, y7]]

    def move(destination_x, destination_y)
      if valid_move?(destination_x, destination_y)
        Piece.update(position_x: destination_x, position_y: destination_y)
        true
      else
        false
      end
    end

    def initial_pawn_location?
        if self.color == 'white'
          INITIAL_WHITE_PAWN_LOCATIONS.include?([self.x_position, self.y_position])
        else
          INITIAL_BLACK_PAWN_LOCATIONS.include?([self.x_position, self.y_position])
        end
    end

    def horizontal_move?(h)
       difference_x = (position_x - h).abs
       difference_x != 0
    end

    def backwards_move?(b)
       color ? position_y > b : position_y < destination_y
    end

    def valid_move?(destination_x, destination_y)
       return false if backwards_move?(destination_y)
       return false if horizontal_move?(destination_x)     
    end

end 
