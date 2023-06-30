# lib/pieces/rook.rb

class Rook < Piece
    def possible_moves
      moves = []
  
      # Moving up
      1.upto(7) do |i|
        break if !in_bounds?(position[0], position[1] + i)
        moves << [position[0], position[1] + i]
        break if occupied_by_piece?(position[0], position[1] + i)
      end
  
      # Moving down
      1.upto(7) do |i|
        break if !in_bounds?(position[0], position[1] - i)
        moves << [position[0], position[1] - i]
        break if occupied_by_piece?(position[0], position[1] - i)
      end
  
      # Moving right
      1.upto(7) do |i|
        break if !in_bounds?(position[0] + i, position[1])
        moves << [position[0] + i, position[1]]
        break if occupied_by_piece?(position[0] + i, position[1])
      end
  
      # Moving left
      1.upto(7) do |i|
        break if !in_bounds?(position[0] - i, position[1])
        moves << [position[0] - i, position[1]]
        break if occupied_by_piece?(position[0] - i, position[1])
      end
  
      moves
    end
  
    private
  
    def in_bounds?(x, y)
      # Make sure the position is on the chess board
      x.between?(0, 7) && y.between?(0, 7)
    end
  
    def occupied_by_piece?(x, y)
      # You'll need to implement this based on your overall game logic.
      # For now, this is just a placeholder.
    end
  end
  