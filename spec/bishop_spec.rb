require_relative 'spec_helper'

describe Bishop do
  describe '#possible_moves' do
    it 'returns all valid moves for a bishop in the center of the board' do
      bishop = Bishop.new(:white, [4, 4])
      expect(bishop.possible_moves.sort).to eq([
        [3, 3], [2, 2], [1, 1], [0, 0], # Down-left
        [5, 5], [6, 6], [7, 7],         # Up-right
        [5, 3], [6, 2], [7, 1],         # Down-right
        [3, 5], [2, 6], [1, 7]          # Up-left
      ].sort)
    end

    it 'returns all valid moves for a bishop in the corner of the board' do
      bishop = Bishop.new(:white, [0, 0])
      expect(bishop.possible_moves.sort).to eq([
        [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7] # Up-right
      ].sort)
    end
  end
end
