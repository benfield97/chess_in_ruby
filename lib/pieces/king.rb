class King < Piece
    def possible_moves
      x, y = position
      moves = []
  
      # Possible moves for the king
      for dx in -1..1
        for dy in -1..1
          # Skip if the move is outside of the board or if it doesn't change the position
          next unless in_bounds?(x + dx) && in_bounds?(y + dy) && !(dx.zero? && dy.zero?)
  
          moves << [x + dx, y + dy]
        end
      end
  
      moves
    end
  
    private
  
    def in_bounds?(value)
      value.between?(0, 7)
    end
  end