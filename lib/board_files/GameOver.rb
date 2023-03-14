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
  def fifty_move_rule(pawn_move=false,target)
    if pawn_move==true
      self.reset_capture_counter
    elsif self[target]!=nil
      self.reset_capture_counter
    else
      self.increment_capture_counter
    end
  end
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
  def not_enough_material?(colour)
    piece_list=find_same_colour_pieces(colour)
    return false if piece_list.any? {|piece| piece.class.name=="Pawn"}
    return false if piece_list.any? {|piece| piece.class.name=="Queen"}
    return false if piece_list.any? {|piece| piece.class.name=="Rook"}
    return false if has_two_bishops_or_bishop_knight(piece_list)
    true
  end
  def has_two_bishops_or_bishop_knight(piece_list)
    if piece_list.any? {|piece| piece.class.name=="Bishop"&&piece.colour=="white"}
      return true if piece_list.any? {|piece| piece.class.name=="Bishop"&&piece.colour=="black"}
    end
    if piece_list.any? {|piece| piece.class.name=="Knight"}
      return true if piece_list.any? {|piece| piece.class.name=="Bishop"}
    end
    false
  end
  def update_board_history
    board_position=board.flatten
    arr=board_position.map {|piece| piece.to_s}
    board_history << arr
  end
  def three_fold_repetition
    update_board_history
    board_count = board_history.uniq.map {|position| board_history.count(position)}
    return true if board_count.include?(3)
    false
  end
end