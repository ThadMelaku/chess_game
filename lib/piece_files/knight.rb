require_relative 'piece'
require_relative 'ShortMoves'
class Knight < Piece
  include ShortMoves
  def to_s
    colour == "white" ? 'N' : 'n'
  end
  def all_moves
    moves = [
      [-1, -2], [1, 2], [-1, 2], [1, -2], [-2, -1], [2, 1], [-2, 1], [2, -1]
    ]
  end
end