# spec/rook_spec.rb
require_relative 'spec_helper'

RSpec.describe Rook do
  let(:rook) { Rook.new(color, position) }

  context "when white" do
    let(:color) { :white }

    context "at starting position" do
      let(:position) { [0, 7] }

      it "can only move forward or to the right" do
        expect(rook.possible_moves).to contain_exactly(
          # Moving down (forward)
          [0, 6], [0, 5], [0, 4], [0, 3], [0, 2], [0, 1], [0, 0],
          # Moving right
          [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 7]
        )
      end
    end

    context "at a middle position" do
      let(:position) { [3, 3] }

      it "can move in any direction" do
        expect(rook.possible_moves).to contain_exactly(
          # Moving up
          [3, 4], [3, 5], [3, 6], [3, 7],
          # Moving down
          [3, 2], [3, 1], [3, 0],
          # Moving right
          [4, 3], [5, 3], [6, 3], [7, 3],
          # Moving left
          [2, 3], [1, 3], [0, 3]
        )
      end
    end
  end
end
