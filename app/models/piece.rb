class Piece < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def obstructed?(destination_x, destination_y)
    route = route_validation(position_x, position_y, destination_x, destination_y)
      if route == 'vertical'
          return vertical_obstruction(destination_x, destination_y)
      end
      if route == 'horizontal'
          return horizontal_obstruction(destination_x, destination_y)
      end
      if route == 'diagonal'
          return diagonal_obstruction(destination_x, destination_y)
      end
      return nil
  end


  def route_validation(position_x, position_y, destination_x, destination_y)
    x_diff = position_x - destination_x
    y_diff = position_y - destination_y
      if x_diff == 0
          return 'vertical'
      elsif y_diff == 0
          return 'horizontal'
      elsif (x_diff.abs == y_diff.abs)
          return 'diagonal'
      else
          return nil
      end
  end


  def vertical_obstruction(destination_x, destination_y)
      #vertically up
      if (destination_y > position_y)
          position_range_y = [(position_y + 1)..(destination_y - 1)]
      else
        #vertically down
          #position_range_y = [(position_y - 1)..(destination_y + 1)]
          position_range_y = [(destination_y + 1)..(position_y - 1)]
      end

    vertical_obstructing_pieces = Piece.where(game_id: game_id, position_x: position_x, position_y: position_range_y)
      if vertical_obstructing_pieces.empty?
        return false
      else
        return true
      end
  end

  def horizontal_obstruction(destination_x, destination_y)
      #horizontal left to right
      if (destination_x > position_x)
        position_range_x = [(position_x + 1)..(destination_x - 1)]
      else
      #horizontal right to left
        position_range_x = [(destination_x + 1)..(position_x - 1)]
      end
        horizontal_obstructing_pieces = Piece.where(game_id: game_id, position_x: position_range_x, position_y: position_y)
      if horizontal_obstructing_pieces.empty?
        #ie true the array is empty thus no horizontal obstruction
        return false
      else
      #ie false the array contains something thus there's horizontal obstruction
        return true
      end
  end

  def diagonal_obstruction(destination_x, destination_y)
    #diagonally up
    if (position_x < destination_x)
      (position_x + 1).upto(destination_x -1) do |x|
        delta_x = x
        delta_y = position_y + x
          diagonal_obstructing_pieces = Piece.where(game_id: game_id, position_x: delta_x, position_y: delta_y)
          if diagonal_obstructing_pieces.empty?
            return false
          else
            return true
          end
      end
    elsif (position_x > destination_x)
      # (position_x - 1).upto(destination_x + 1) do |x|
      (destination_x + 1).upto(position_x - 1) do |x|
        delta_x = x
        delta_y = destination_y + x
          diagonal_obstructing_pieces = Piece.where(game_id: game_id, position_x: delta_x, position_y: delta_y)
          if diagonal_obstructing_pieces.empty?
            #ie true the array is empty thus no diagonal obstruction
            return false
          else
            #ie false the array contains something thus there's diagonal obstruction
            return true
          end
      end
    end
  end


end
