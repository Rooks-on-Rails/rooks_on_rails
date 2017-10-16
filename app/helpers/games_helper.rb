module GamesHelper
  def render_piece(x, y)
    @game.pieces.find_by(position_x: x, position_y: y)
    # return nil unless piece
    binding.pry
    image_tag(piece.icon_path, size: '48x48')
    # image_tag('black_rook.svg', size: '48x48', alt: 'Black Rook')
  end
end
