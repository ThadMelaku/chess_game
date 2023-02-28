require_relative 'piece'
require_relative 'LongMoves'
class Rook < Piece
  include LongMoves
  def to_s
    colour == "white" ? 'R' : 'r'
  end
  def all_moves
    moves = [
      [ 1, 0], [ 2, 0], [ 3, 0], [ 4, 0], [ 5, 0], [ 6, 0], [ 7, 0],
      [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0],
      [ 0,-1], [ 0,-2], [ 0,-3], [ 0,-4], [ 0,-5], [ 0,-6], [ 0,-7],
      [ 0, 1], [ 0, 2], [ 0, 3], [ 0, 4], [ 0, 5], [ 0, 6], [ 0, 7]
    ]
  end
end