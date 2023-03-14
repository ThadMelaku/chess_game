require_relative 'piece'
require_relative 'LongMoves'
class Bishop < Piece
  include LongMoves
  def to_s
    colour == :white ? '♗' : '♝'
    #colour == "white" ? 'B' : 'b'
  end
  def all_moves
    moves = [[ 1, 1], [-1, 1], [1 ,-1], [-1,-1]]
  end
end