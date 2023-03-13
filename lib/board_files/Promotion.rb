require_relative './MovePiece.rb'
module Promotion
  attr_accessor :input, :test_input 
  def pawn_promotion?(start,target)
    return false unless target[0]==0 || target[0]==7
    return false unless target[1]==start[1] #same row 
    puts "checking pawn promotion"
    promotion_input if test_input==false
    piece_name = full_piece_name
    promote_pawn(self[start],target,piece_name)
    return true
  end
  def promotion_input(user_input=nil)
    if user_input==nil
      puts "what would you like to promote to?"
      puts " 'Q' 'R' 'B' 'N' "
      user_input ||= gets.chomp
        letters = /^[qrbnQRBN]$/
      while letters.match?(user_input)==false 
        puts " "
        puts "#{user_input} is not valid"
        puts "enter one of the following: 'Q' 'R' 'B' 'N' "

        user_input=gets.chomp
      end
    end
    @input = user_input.upcase
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
      self[target]=piece_name.new(target,pawn.colour,self)
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
    incheck=dummy_board.in_check?(pawn.colour)
  end
end