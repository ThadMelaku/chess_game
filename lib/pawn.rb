class Pawn
  attr_accessor :position, :colour
  def initialize(position,colour)
    @position=position
    @colour=colour
  end

  def row
    position[0]
  end
  def col
    position[1]
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