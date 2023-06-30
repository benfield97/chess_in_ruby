require 'rspec'
require_relative 'board'

describe Board do
  subject(:board) { Board.new }

  describe "#initialize" do
    it "creates an 8x8 grid" do
      expect(board.grid.length).to eq(8)
      expect(board.grid.all? { |row| row.length == 8 }).to be true
    end

    it "sets up the pieces in their correct initial positions" do
      # Tests for each piece go here
    end
  end

  describe "#move_piece" do
    context "when the start position is empty" do
      it "raises an error" do
        expect { board.move_piece([0, 0], [1, 1]) }.to raise_error("No piece at start position")
      end
    end

    # More contexts and tests for #move_piece go here
  end

  # More describe blocks for the other methods go here
end