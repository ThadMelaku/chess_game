require_relative './MovePiece.rb'
module Promotion
  attr_accessor :input 
  def pawn_promotion?(start,target,test_move=false)
    return false unless target[0]==0 || target[0]==7
    puts "checking pawn promotion"

    promotion_input if input == nil
    piece_name = full_piece_name
    promote_pawn(self[start],target,piece_name)
    return true
  end
  def promotion_input(user_input=nil)
    if user_input==nil
      puts "what would you like to promote to?"
      puts " 'Q' 'R' 'B' 'N' "
      user_input ||= gets.chomp
    end
    @input = user_input
  end

  def full_piece_name
    case input
    when "Q"
      piece_name=Queen
    when "R"
      piece_name=Rook
    when "B"
      piece_name=Bishop
    when "N"
      piece_name=Knight
    end
  end
  def promote_pawn(pawn,target,piece_name)
    unless illegal_move?(pawn,target,piece_name)
      self[target]=piece_name.new([target],pawn.colour,self)
      self[pawn.position]=nil
      pawn=nil
    else
      puts "cannot promote to #{piece_name}"
    end
  end
  def illegal_move?(pawn,target,piece_name)
    dummy_board = self.dummy
    dummy_board[target]=piece_name.new([target],pawn.colour,dummy_board)
    dummy_board[pawn.position]=nil
    #p dummy_board.in_check?(pawn,pawn.colour)
    incheck=dummy_board.in_check?(pawn,pawn.colour)
  end
end