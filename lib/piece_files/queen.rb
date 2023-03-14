require_relative 'piece'
require_relative 'LongMoves'
class Queen < Piece
  include LongMoves
  def to_s
    colour == "white" ? '♕' : '♛'
    #colour == "white" ? 'Q' : 'q'
  end
  def all_moves
    moves = [[ 1, 1], [-1, 1], [1 ,-1], [-1,-1],[ 1, 0],[-1, 0],[ 0,-1],[ 0, 1]]
  end
end