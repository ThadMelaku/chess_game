require_relative 'piece'
require_relative 'LongMoves'
class Bishop < Piece
  include LongMoves
  def to_s
    colour == "white" ? 'B' : 'b'
  end
  def all_moves
    moves = [
      [ 1, 1], [ 2, 2], [ 3, 3], [ 4, 4], [ 5, 5], [ 6, 6], [ 7, 7],
      [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7],
      [1 ,-1], [2 ,-2], [ 3,-3], [ 4,-4], [ 5,-5], [ 6,-6], [ 7,-7],
      [-1,-1], [-2,-2], [-3,-3], [-4,-4], [-5,-5], [-6,-6], [-7,-7]
    ]
  end
end