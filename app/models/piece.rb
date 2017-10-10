class Piece < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def obstructed?(destination_x, destination_y)
    #Horizontal Obstructions
    if condition
  
    #Vertical Obstructions
    elsif condition
      
  
    #Diagonal Obstructions
    elsif condition
      
  
    #Invalid Input  
    else condition
  
  end

  
end
