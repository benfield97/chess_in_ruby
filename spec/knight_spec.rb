# spec/knight_spec.rb
require_relative 'spec_helper'

RSpec.describe Knight do
  let(:knight) { Knight.new(color, position) }

  context "when white" do
    let(:color) { :white }

    context "at starting position" do
        let(:position) { [1, 7] }
      
        it "can move to three positions" do
          expect(knight.possible_moves).to contain_exactly([0, 5], [2, 5], [3, 6])
        end
      end
      

    context "at a middle position" do
      let(:position) { [3, 3] }

      it "can move to eight positions" do
        expect(knight.possible_moves).to contain_exactly(
          [1, 2], [1, 4], [2, 1], [2, 5],
          [4, 1], [4, 5], [5, 2], [5, 4]
        )
      end
    end
  end
end
