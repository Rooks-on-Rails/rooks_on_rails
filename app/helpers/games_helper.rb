module GamesHelper

  # def test
  #   "This is a test"    
  # end
  def render_piece(x, y)
    piece = @game.pieces.find_by(position_x, position_y)
    return nil unless piece

    image_tag("black_rook.svg")
  end
end
