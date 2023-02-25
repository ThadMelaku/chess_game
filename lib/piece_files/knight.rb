require_relative 'piece'
class Knight < Piece
  def moves
    moves = [
      [-1, -2], [1, 2], [-1, 2], [1, -2], [-2, -1], [2, 1], [-2, 1], [2, -1]
    ]
  end
end