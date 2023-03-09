require_relative './EnPassant.rb'
require_relative './Castle.rb'
require_relative './Promotion.rb'
require_relative './GameOver.rb'
#used by Board class to move piece from start to target position
module MovePiece
  include GameOver, Promotion, Castle, EnPassant
  def move(start,target)
    legal_move=nil
    piece = self[start]
    if piece == nil
      puts "pick a valid piece"
      return
    end
    row,col=target
    valid=piece.between_0_and_7(row,col)
    legal=piece.legal_moves.include?(target)
    legal_move=(valid&&legal)

    castle_legal=false
    castle_legal=castle(start,target) if piece.class.name=="King"

    promote=pawn_promotion?(start,target) if piece.class.name=="Pawn"
    
    if legal_move==true
      puts "this is a valid move"
      move_piece(start,target) unless promote==true
      return true
    elsif castle_legal==true
      puts "king can castle"
      return true
    elsif promote==true
      puts "pawn can promote"
      return true
    else
      puts"enter a valid move"
      return false
    end
  end
  def move_piece(start,target,test_move=false)
    enpassant(start,target,test_move) if self[start].class.name=="Pawn"
    self[target]=self[start]
    self[start]=nil
    self[target].position = target
    self[target].initial_position=false if self[target].class.name=="King"||self[target].class.name=="Rook"
  end
end