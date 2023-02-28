require_relative 'piece'
require_relative 'PawnMoves'
class Pawn < Piece
  include PawnMoves
  def to_s
    #colour == :white ? '♙' : '♟︎'
    colour == "white" ? 'P' : 'p'
  end
  def initial_position?
    (colour=="white"&&row==1)||(colour=="black"&&row==6)
  end
  def initial_moves
    return initial_moves = [[1,0],[1,1],[1,-1],[2,0]] if colour == "white"
    return initial_moves = [[-1,0],[-1,1],[-1,-1],[-2,0]] if colour == "black"
  end

  def moves
    return moves = initial_moves if initial_position?
    return moves = [[1,0],[1,1],[1,-1]] if colour == "white"
    return moves = [[-1,0],[-1,1],[-1,-1]] if colour == "black"
  end

end