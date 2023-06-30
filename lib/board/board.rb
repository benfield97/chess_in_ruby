class Board
    attr_reader :grid
  
    def initialize
      @grid = Array.new(8) { Array.new(8) }
      setup_pieces
    end
  
    def setup_pieces
      (0..7).each do |i|
        @grid[1][i] = Pawn.new(:black, self, [1, i])
        @grid[6][i] = Pawn.new(:white, self, [6, i])
      end
      # Setup other pieces for black
      @grid[0][0] = Rook.new(:black, self, [0, 0])
      @grid[0][1] = Knight.new(:black, self, [0, 1])
      @grid[0][2] = Bishop.new(:black, self, [0, 2])
      @grid[0][3] = Queen.new(:black, self, [0, 3])
      @grid[0][4] = King.new(:black, self, [0, 4])
      @grid[0][5] = Bishop.new(:black, self, [0, 5])
      @grid[0][6] = Knight.new(:black, self, [0, 6])
      @grid[0][7] = Rook.new(:black, self, [0, 7])
      # Setup other pieces for white
      @grid[7][0] = Rook.new(:white, self, [7, 0])
      @grid[7][1] = Knight.new(:white, self, [7, 1])
      @grid[7][2] = Bishop.new(:white, self, [7, 2])
      @grid[7][3] = Queen.new(:white, self, [7, 3])
      @grid[7][4] = King.new(:white, self, [7, 4])
      @grid[7][5] = Bishop.new(:white, self, [7, 5])
      @grid[7][6] = Knight.new(:white, self, [7, 6])
      @grid[7][7] = Rook.new(:white, self, [7, 7])
    end

    
    def move_piece(start_pos, end_pos, color)
        raise 'Invalid position' unless valid_pos?(start_pos) && valid_pos?(end_pos)
        raise 'No piece at start position' if piece_at(start_pos).nil?
        raise 'Piece does not belong to current player' if piece_at(start_pos).color != color
        raise 'Piece cannot move to end position' unless piece_at(start_pos).valid_moves.include?(end_pos)
      
        piece = piece_at(start_pos)
        move_piece!(start_pos, end_pos)
        
        if in_check?(color)
          move_piece!(end_pos, start_pos)  # Undo the move
          raise 'Cannot move into check'
        end
    end
      
    def move_piece!(start_pos, end_pos)
    piece = piece_at(start_pos)
    @grid[start_pos[0]][start_pos[1]] = nil
    @grid[end_pos[0]][end_pos[1]] = piece
    piece.pos = end_pos
    end
    
    def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
    end

    def piece_at(pos)
    @grid[pos[0]][pos[1]]
    end

    def in_check?(color)
        king_pos = find_king(color).pos
        pieces.any? do |piece|
          piece.color != color && piece.moves.include?(king_pos) && path_clear?(piece.pos, king_pos)
        end
      end
      
    def path_clear?(start_pos, end_pos)
    # Implement this method based on the specifics of your Piece classes
    end
      
      
    def find_king(color)
    pieces.find { |piece| piece.is_a?(King) && piece.color == color }
    end
    
    def pieces
    @grid.flatten.compact
    end

    def checkmate?(color)
        return false unless in_check?(color)
      
        pieces.select { |p| p.color == color }.all? do |piece|
          piece.valid_moves.empty?
        end
    end
      
      
      