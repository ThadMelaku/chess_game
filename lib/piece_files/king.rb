require_relative 'piece'
require_relative 'ShortMoves'
class King < Piece
  include ShortMoves
  def to_s
    colour == "white" ? 'K' : 'k'
  end
  def all_moves
    moves = [
      [ 1, 0], [-1, 0], [ 0,-1], [ 0, 1], 
      [ 1, 1], [-1, 1], [1 ,-1], [-1,-1]
    ]
  end
end