# lib/pieces/knight.rb

class Knight < Piece
    def possible_moves
      x, y = position
      moves = [
        [x + 2, y + 1],
        [x + 2, y - 1],
        [x - 2, y + 1],
        [x - 2, y - 1],
        [x + 1, y + 2],
        [x + 1, y - 2],
        [x - 1, y + 2],
        [x - 1, y - 2]
      ]
  
      moves.select { |move| in_bounds?(move) }
    end
  
    private
  
    def in_bounds?(position)
      position.all? { |coord| coord.between?(0, 7) }
    end
  end
  