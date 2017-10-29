module GamesHelper
  def render_piece(x, y)
    piece = @game.pieces.find_by(position_x: x, position_y: y)
    return nil if piece.blank?
    
    link_to image_tag(piece.icon_path, size: '48x48'), piece_path(piece[:id])
    if piece == @current_piece
      "<div class='selected'>".html_safe
    else 
      "<div>".html_safe
    end
    "</div>".html_safe
  end
end
