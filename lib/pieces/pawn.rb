# lib/pieces/pawn.rb
require_relative 'piece'

class Pawn < Piece
  def possible_moves
    x, y = position
    moves = []

    # Pawns can move 1 space forward
    moves << [x, y + forward_direction]

    # Pawns can move 2 spaces forward from their starting position
    if at_starting_position?
      moves << [x, y + 2 * forward_direction]
    end

    moves
  end

  private

  def at_starting_position?
    position[1] == (color == :white ? 6 : 1)
  end

  def forward_direction
    color == :white ? -1 : 1
  end
end
