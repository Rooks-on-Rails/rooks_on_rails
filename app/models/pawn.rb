class Pawn < Piece

    INITIAL_WHITE_PAWN_LOCATIONS = [[x0, y0], [x1, y1], [x2, y2], [x3, y3], [x4, y4], [x5, y5], [x6, y6] [x7, y7]]
    INITIAL_BLACK_PAWN_LOCATIONS = [[x0, y0], [x1, y1], [x2, y2], [x3, y3], [x4, y4], [x5, y5], [x6, y6] [x7, y7]]

    def initial_pawn_locations
        if self.color == 'white'
          INITIAL_WHITE_PAWN_LOCATIONS.include?(self.x_position, self.y_position)
        else
          INITIAL_BLACK_PAWN_LOCATIONS.include?(self.x_position, self.y_position)
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
