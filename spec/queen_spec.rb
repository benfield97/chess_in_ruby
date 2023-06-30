# spec/queen_spec.rb
require_relative 'spec_helper'

RSpec.describe Queen do
  let(:queen) { Queen.new(color, position) }

  context "when white" do
    let(:color) { :white }

    context "at starting position" do
      let(:position) { [3, 0] }

      it "can move horizontally, vertically and diagonally" do
        # Expectation includes all horizontal, vertical and diagonal moves from the position [3, 0]
        expect(queen.possible_moves).to contain_exactly(
          # Horizontal moves
          [0, 0], [1, 0], [2, 0], [4, 0], [5, 0], [6, 0], [7, 0],
          # Vertical moves
          [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7],
          # Diagonal moves
          [2, 1], [1, 2], [0, 3], [4, 1], [5, 2], [6, 3], [7, 4]
        )
      end
    end

    context "at a middle position" do
      let(:position) { [4, 4] }

      it "can move horizontally, vertically and diagonally" do
        # Expectation includes all horizontal, vertical and diagonal moves from the position [4, 4]
        expect(queen.possible_moves).to contain_exactly(
          # Horizontal moves
          [0, 4], [1, 4], [2, 4], [3, 4], [5, 4], [6, 4], [7, 4],
          # Vertical moves
          [4, 0], [4, 1], [4, 2], [4, 3], [4, 5], [4, 6], [4, 7],
          # Diagonal moves
          [0, 0], [1, 1], [2, 2], [3, 3], [5, 5], [6, 6], [7, 7],
          [7, 1], [6, 2], [5, 3], [3, 5], [2, 6], [1, 7]
        )
      end
    end
  end
end
