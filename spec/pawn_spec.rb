# spec/pieces/pawn_spec.rb
require_relative 'spec_helper'

RSpec.describe Pawn do
  let(:pawn) { Pawn.new(color, position) }

  context "when white" do
    let(:color) { :white }

    context "at starting position" do
      let(:position) { [0, 6] }

      it "can move 1 or 2 spaces forward" do
        expect(pawn.possible_moves).to contain_exactly([0, 5], [0, 4])
      end
    end

    context "not at starting position" do
      let(:position) { [0, 5] }

      it "can move 1 space forward" do
        expect(pawn.possible_moves).to contain_exactly([0, 4])
      end
    end
  end

  context "when black" do
    let(:color) { :black }

    context "at starting position" do
      let(:position) { [0, 1] }

      it "can move 1 or 2 spaces forward" do
        expect(pawn.possible_moves).to contain_exactly([0, 2], [0, 3])
      end
    end

    context "not at starting position" do
      let(:position) { [0, 2] }

      it "can move 1 space forward" do
        expect(pawn.possible_moves).to contain_exactly([0, 3])
      end
    end
  end
end