class Bishop < Piece
    def possible_moves
      x, y = position
      moves = []
  
      # Diagonal moves in all four directions
      for i in 1..7
        moves << [x + i, y + i] if in_bounds?(x + i) && in_bounds?(y + i) # Up-right
        moves << [x - i, y - i] if in_bounds?(x - i) && in_bounds?(y - i) # Down-left
        moves << [x + i, y - i] if in_bounds?(x + i) && in_bounds?(y - i) # Down-right
        moves << [x - i, y + i] if in_bounds?(x - i) && in_bounds?(y + i) # Up-left
      end
  
      moves
    end
  
    private
  
    def in_bounds?(value)
      value.between?(0, 7)
    end
  end
  