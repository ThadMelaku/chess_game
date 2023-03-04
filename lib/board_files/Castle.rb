module Castle
  def castle(start,target,test_move=false)
    #Has the king moved
    return false unless self[start].initial_position

    #1)which side are we castling
    move=[target[0]-start[0],target[1]-start[1]]

    if move[1]==2 #Queenside castle
      rook=self[[start[0],7]]     
    elsif move[1]==-2#Kingisde castle
      rook=self[[start[0],0]] 
    end

    #2)Is the rook on that side in its initial position
    if rook == nil #No rook available to castle kingside
      return false 
    elsif rook.initial_position==false #Rook has moved, and cannot be castled
      return false
    end

    #3)is it clear to castle

    if move[1]==2 #false if Queenside is not clear
      return false unless (self[[start[0],4]].nil? && self[[start[0],5]].nil? && self[[start[0],6]].nil?)     
    elsif move[1]==-2#false if Kingside is not clear
      return false unless (self[[start[0],1]].nil? && self[[start[0],2]].nil? )
    end

    #4)Does the king travel through check
    if move[1]==2 #Queenside castle

    elsif move[1]==-2#Kingisde castle
      squares = [[start[0],1],[start[0],2]]
      return false unless legal_squares(squares,start) #false if king passes through check  
      castle!(start,target)      
    end

    return true
  end

  #king is not in check passing through these squares
  def legal_squares(squares,start)
    squares.each do |move| 
      dummy_board = self.dummy
      dummy_board.move_piece(start,move,true) #true because it is a testmove

      if dummy_board.in_check?(dummy_board[move],dummy_board[move].colour) #not in check, then the move is safe
        return false
      end
    end
    return true
  end

  def castle!(start,target)
    self.move_piece(start,target)
    self.move_piece([start[0],0],[start[0],2])
  end
  

end