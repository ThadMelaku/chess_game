require_relative 'piece'
require_relative 'LongMoves'
class Rook < Piece
  include LongMoves
  def to_s
    colour == "white" ? '♖' : '♜'
    #colour == "white" ? 'R' : 'r'
  end
  def all_moves
    moves = [[ 1, 0],[-1, 0],[ 0,-1],[ 0, 1]]
  end
end