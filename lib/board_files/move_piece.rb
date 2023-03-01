#used by Board class to move piece from start to target position
module MovePiece
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
    
    if legal_move==true
      puts "this is a valid move"
      move_piece(start,target) 
    else
      puts"enter a valid move"
    #prompt for input
    end
  end
  def move_piece(start,target)
    self[target]=self[start]
    self[start]=nil
    self[target].position = target
  end

  def in_check?(piece,colour)
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