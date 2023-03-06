module Castle
  def castle(start,target,test_move=false)
    #1)Has the king moved?
    king=self[start]
    return false unless king.initial_position==true

    #2)Which side are we castling?
    move=[target[0]-start[0],target[1]-start[1]]

    if move[1]==2 #Queenside castle
      rook=self[[start[0],7]]     
    elsif move[1]==-2#Kingisde castle
      rook=self[[start[0],0]] 
    end

    #3)Has the rook moved?
    #No rook available, or the rook has moved and cannot be castled
    return false if rook == nil || rook.initial_position==false

    #4)Is it clear and safe to castle?
    if move[1]==2 
      return false unless queenside_clear?(start)    
      squares = [[start[0],4],[start[0],5]]
      return false unless squares_are_safe?(squares,start) 
      castle!(start,target,"queenside")
    elsif move[1]==-2
      return false unless kingside_clear?(start)
      squares = [[start[0],1],[start[0],2]]
      return false unless squares_are_safe?(squares,start) 
      castle!(start,target,"kingside") 
    end

    king.initial_position=false
    rook.initial_position=false
    return true
  end

  def kingside_clear?(start) #return false, if Kingside is not clear
    return (self[[start[0],1]].nil? && self[[start[0],2]].nil?)
  end
  def queenside_clear?(start) #return false, if Queenside is not clear
    return (self[[start[0],4]].nil? && self[[start[0],5]].nil? && self[[start[0],6]].nil?) 
  end

  def squares_are_safe?(squares,start) #return false, if king passes through check
    squares.each do |move| 
      dummy_board = self.dummy
      dummy_board.move_piece(start,move,true) #true because it is a testmove

      if dummy_board.in_check?(dummy_board[move],dummy_board[move].colour)
        return false
      end
    end
    return true
  end

  def castle!(start,target,side)
    self.move_piece(start,target)
    self.move_piece([start[0],0],[start[0],2]) if side == "kingside"
    self.move_piece([start[0],7],[start[0],4]) if side == "queenside"
  end
  
end