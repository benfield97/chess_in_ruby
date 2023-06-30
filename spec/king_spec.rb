require_relative 'spec_helper'

describe King do
  describe '#possible_moves' do
    it 'returns all valid moves for a king in the center of the board' do
      king = King.new(:white, [4, 4])
      expect(king.possible_moves.sort).to eq([
        [3, 3], [3, 4], [3, 5],
        [4, 3],        [4, 5],
        [5, 3], [5, 4], [5, 5]
      ].sort)
    end

    it 'returns all valid moves for a king in the corner of the board' do
      king = King.new(:white, [0, 0])
      expect(king.possible_moves.sort).to eq([
                  [0, 1],
        [1, 0], [1, 1]
      ].sort)
    end
  end
end
