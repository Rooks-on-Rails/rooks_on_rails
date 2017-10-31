module GamesHelper
  def render_piece(x, y)
    piece = @game.pieces.find_by(position_x: x, position_y: y)
    return nil if piece.blank?

    # link_to image_tag(piece.icon_path, size: '48x48'), piece_path(piece[:id])
    if piece == @current_piece
      content_tag(:div, image_tag(piece.icon_path, size: '48x48'), class: 'selected')
    else
      link_to image_tag(piece.icon_path, size: '48x48'), piece_path(piece[:id])
    end
  end
end
