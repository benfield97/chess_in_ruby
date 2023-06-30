# lib/pieces/piece.rb

class Piece
    attr_reader :color, :position
  
    def initialize(color, position)
      @color = color
      @position = position
    end
  end
  