#mixedin with MovePiece module to be used by Board class
module EnPassant
    
    def enpassant(start,target,test_move=false)
      move=[target[0]-start[0],target[1]-start[1]]
  
      #check if caputuring diagonally
      #check if there is a opposite coloured pawn with en_passant==true
      if move[1]==1
        target_pawn=[start[0],start[1]+1]
        self[target_pawn]=nil if self[target_pawn].en_passant==true #set captured pawn to nil
      elsif move[1]==-1
        target_pawn=[start[0],start[1]-1]
        self[target_pawn]=nil if self[target_pawn].en_passant==true #set captured pawn to nil
      end

      #checks if a pawn moves 2 squares, and sets en_passant variable accordingly
      if test_move==false
        reset_enpassant #sets all en_passant vars to false 
        start[0]>=target[0]? squares_moved=start[0]-target[0]: squares_moved=target[0]-start[0]
        self[start].en_passant=true if squares_moved==2
      end
    end
    
    def reset_enpassant
      piece_list = board.flatten
      piece_list.each do |piece| 
        if piece!=nil && piece.class.name=="Pawn"
          piece.en_passant=false
        end
      end
    end

end