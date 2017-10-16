module GamesHelper
  def render_piece(x, y)
    @game.pieces.find_by(position_x: x, position_y: y)
    # return nil unless piece

    # I want to pull the icon of the piece in here by calling the icon method in each piece's model
    # I've tried:
    # piece.icon
    # Piece.type.icon
    # piece.type.icon
  end
end
