module GamesHelper
  def render_piece(x, y)
    piece = @game.pieces.find_by(position_x: x, position_y: y)

    if piece == @current_piece
      content_tag(:div, image_tag(piece.icon_path, size: '48x48'), class: 'selected')
    elsif piece.present? 
      link_to image_tag(piece.icon_path, size: '48x48'), piece_path(piece[:id])
    else
      # "Testing"
      simple_form_for(@current_piece, url: piece_path(@current_piece)) do |f|
        # f.input position_x, as: :hidden, input_html: {value: x} 
        # f.input position_y,
        # f.hidden_field(:position_x, value: x) +
        # f.hidden_field(:position_y, value: y) +
        f.submit 'Update'
      end
    end
  end
end
