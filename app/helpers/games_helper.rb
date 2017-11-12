module GamesHelper
  def render_piece(x, y)
    piece = @game.pieces.find_by(position_x: x, position_y: y)

    if piece.present? 
      link_to image_tag(piece.icon_path, size: '48x48'), piece_path(piece[:id])      
    end
  end
end
# piece == nil
#       simple_form_for(@current_piece, url: piece_path(@current_piece)) do |f|
#         f.input position_x, as: :hidden, input_html: {value: x} 
#         f.input position_y, as: :hidden, input_html: {value: y}
#         f.submit 'Update'
#       end


# piece == @current_piece
#       content_tag(:div, image_tag(piece.icon_path, size: '48x48'), class: 'selected')
