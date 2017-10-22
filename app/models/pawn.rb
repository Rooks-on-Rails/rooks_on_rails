class Pawn < Piece

 def first_move
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
    return true if capture_move?(destination_x, destination_y)
    return false if horizontal_move?(destination_x)     
 end

 def vertical_capture
 end

 def horizontal_capture
 end

end
