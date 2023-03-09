module GameOver

  def checkmate?(colour)
    return false unless in_check?(colour)
    return no_legal_moves(colour)
  end

  def stalemate?(colour)
    return false if in_check?(colour)
    return no_legal_moves(colour)
  end

  def no_legal_moves(colour)
    same_pieces = find_same_colour_pieces(colour)
    same_pieces.each do |piece| 
      return false if piece.legal_moves!=[] #false if colour has at least 1 legal move
    end
    return true #true if colour has no legal moves
  end

  #50moverule
    #board.moves_without_capture

  def in_check?(colour) 
    king=find_king(colour)
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
  def find_same_colour_pieces(colour)
    colour = (colour=="white" ? "black" : "white")
    find_opposite_colour_pieces(colour)
  end

end