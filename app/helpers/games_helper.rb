module GamesHelper
  def render_piece(x, y)
    piece = @game.pieces.find_by(position_x: x, position_y: y)
    return nil if piece.blank?

    image_tag(piece.icon_path, size: '48x48')
  end
end
