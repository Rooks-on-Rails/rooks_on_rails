class Bishop < Piece
  def icon
    if piece.color == 'white'
      return image_tag('white_bishop.svg', size: '48x48', alt: 'White Bishop')
    else
      return image_tag('black_bishop.svg', size: '48x48', alt: 'Black Bishop')
    end
  end
end
