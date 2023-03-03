module PawnMoves
  #possible moves to empty squares or squares with enemy pieces or enpassant
  def possible_moves
    moveset=[]
    #add enpassant moves if possible
    moveset=check_enpassant(moveset)
    moves.each do |(row,col)|
      curr_row, curr_col = position
      curr_row += row
      curr_col += col

      square = [curr_row, curr_col]
      next unless self.between_0_and_7(curr_row,curr_col)

      #move forward 2 squares
      if (row==2||row==-2) 
        in_between_square=[curr_row-1,curr_col] if row==2
        in_between_square=[curr_row+1,curr_col] if row==-2
        if board.empty_square?(square) && board.empty_square?(in_between_square) 
          moveset << square
        end
      #move forward 1 square
      elsif col==0&&board.empty_square?(square)
        moveset << square
      #capture enemy piece diagonally
      elsif col!=0&&opponent_piece?(square)
        moveset << square
      end
    end
    moveset
  end

  def check_enpassant(moveset)
    left_adjacent=nil
    right_adjacent=nil
    return moveset unless (colour=="white"&&row==4)||(colour=="black"&&row==3)
    if self.between_0_and_7(row,col-1)
      left_adjacent=[row,col-1]
      if colour=="white" && opponent_piece?(left_adjacent)
        moveset << [5,col-1] if board[left_adjacent].en_passant==true
      elsif colour=="black" && opponent_piece?(left_adjacent)
        moveset << [2,col-1] if board[left_adjacent].en_passant==true
      end
    end

    if self.between_0_and_7(row,col+1)
      right_adjacent=[row,col+1] 
      if colour=="white" && opponent_piece?(right_adjacent)
        moveset << [5,col+1] if board[right_adjacent].en_passant==true
      elsif colour=="black" && opponent_piece?(right_adjacent)
        moveset << [2,col+1] if board[right_adjacent].en_passant==true
      end
    end
    moveset
  end
end