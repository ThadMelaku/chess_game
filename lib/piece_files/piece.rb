class Piece
  attr_accessor :position, :colour, :board, :en_passant, :initial_position

  def initialize(position,colour,board)
    @position=position
    @colour=colour
    @board=board
    @en_passant=false if self.class.name=="Pawn"
    @initial_position=true if self.class.name=="King"||self.class.name=="Rook"
  end
  def row
    position[0]
  end
  def col
    position[1]
  end
  def opponent_piece?(square)
    return if board[square] == nil
    board[square].colour != colour
  end
  def legal_moves
    legal_moves = []
    self.possible_moves.each do |move| 
      dummy_board = board.dummy
      dummy_board.move_piece(position,move,true) #true because it is a testmove

      unless dummy_board.in_check?(colour) #not in check, then the move is safe
        legal_moves << move
      end
    end
    legal_moves
  end
  def between_0_and_7(num1,num2)
    return (0<=num1 && num1 <8 && 0<=num2 && num2<8) #true if both num1 and num2 are between 0 and 7
  end

end