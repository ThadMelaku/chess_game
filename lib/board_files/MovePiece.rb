require_relative './EnPassant.rb'
require_relative './Castle.rb'
require_relative './Promotion.rb'
#used by Board class to move piece from start to target position
module MovePiece
  include Promotion, Castle, EnPassant
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
    elsif castle_legal==true
      puts "king can castle"
    elsif promote==true
      puts "pawn can promote"
    else
      puts"enter a valid move"
      #prompt for input
    end
  end
  def move_piece(start,target,test_move=false)
    enpassant(start,target,test_move) if self[start].class.name=="Pawn"

    self[target]=self[start]
    self[start]=nil
    self[target].position = target
    self[target].initial_position=false if self[target].class.name=="King"||self[target].class.name=="Rook"
    
  end

  def in_check?(piece,colour) #remove colour parameter use piece.colour
    king=find_king(piece.colour)
    raise NoKingError.new('King not found') if king==nil

    opposite_pieces = find_opposite_colour_pieces(colour)
    opposite_pieces.each do |piece|
      return true if piece.possible_moves.include?(king.position)
    end
    return false
  end

  def find_king(colour)
    king=[]
    piece_list = board.flatten
    piece_list.each do |piece| 
      if piece!=nil && piece.colour==colour && piece.class.name=="King"
        king=piece
      end
    end
    king
  end
  def find_opposite_colour_pieces(colour)
    piece_list = board.flatten
    piece_list.select {|piece| piece!=nil && piece.colour!=colour}
  end
end