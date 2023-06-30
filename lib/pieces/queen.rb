class Queen < Piece
    def possible_moves
      x, y = position
      moves = []
  
      # Horizontal and vertical moves
      for i in 0..7
        moves << [i, y] unless i == x
        moves << [x, i] unless i == y
      end
  
      # Diagonal moves
      for i in -7..7
        moves << [x + i, y + i] unless i == 0 || !in_bounds?(x + i) || !in_bounds?(y + i)
        moves << [x + i, y - i] unless i == 0 || !in_bounds?(x + i) || !in_bounds?(y - i)
      end
  
      moves
    end
  
    private
  
    def in_bounds?(value)
      value.between?(0, 7)
    end
  end
  