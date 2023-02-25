require_relative 'piece'
class King < Piece
  def moves
    moves = [
      [ 1, 0], [-1, 0], [ 0,-1], [ 0, 1], 
      [ 1, 1], [-1, 1], [1 ,-1], [-1,-1]
    ]
  end
end