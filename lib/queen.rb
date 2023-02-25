class Queen
  attr_accessor :position, :colour

  def initialize(position,colour)
    @position=position
    @colour=colour
  end

  def moves
    moves = [
      [ 1, 0], [ 2, 0], [ 3, 0], [ 4, 0], [ 5, 0], [ 6, 0], [ 7, 0],
      [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0],
      [ 0,-1], [ 0,-2], [ 0,-3], [ 0,-4], [ 0,-5], [ 0,-6], [ 0,-7],
      [ 0, 1], [ 0, 2], [ 0, 3], [ 0, 4], [ 0, 5], [ 0, 6], [ 0, 7],
      [ 1, 1], [ 2, 2], [ 3, 3], [ 4, 4], [ 5, 5], [ 6, 6], [ 7, 7],
      [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7],
      [1 ,-1], [2 ,-2], [ 3,-3], [ 4,-4], [ 5,-5], [ 6,-6], [ 7,-7],
      [-1,-1], [-2,-2], [-3,-3], [-4,-4], [-5,-5], [-6,-6], [-7,-7]
    ]
  end
  def possible_moves
    possible_moves = []
    moves.each do |move| 
      x = position[0] + move[0]
      y = position[1] + move[1]
      possible_moves << [x,y] if between_0_and_7(x,y)
    end
      possible_moves
  end
  def between_0_and_7(num1,num2)
    return (0<=num1 && num1 <8 && 0<=num2 && num2<8) #true if both num1 and num2 are between 0 and 7
  end

end