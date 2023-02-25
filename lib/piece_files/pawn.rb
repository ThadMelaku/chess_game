require_relative 'piece'
class Pawn < Piece
  def to_s
    #colour == :white ? '♙' : '♟︎'
    colour == "white" ? 'P' : 'p'
  end
  def initial_position?
    (colour=="white"&&row==6)||(colour=="black"&&row==1)
  end
  def initial_moves
    return initial_moves = [[1,0],[1,1],[1,-1],[2,0]] if colour == "black"
    return initial_moves = [[-1,0],[-1,1],[-1,-1],[-2,0]] if colour == "white"
  end

  def moves
    return moves = initial_moves if initial_position?
    return moves = [[1,0],[1,1],[1,-1]] if colour == "black"
    return moves = [[-1,0],[-1,1],[-1,-1]] if colour == "white"
  end

end