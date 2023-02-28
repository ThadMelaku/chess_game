module PawnMoves
  #possible moves to empty squares or squares with enemy pieces or enpassant
  def possible_moves
    moveset=[]
    moves.each do |(row,col)|
      curr_row, curr_col = position
      curr_row += row
      curr_col += col

      square = [curr_row, curr_col]
      break unless self.between_0_and_7(curr_row,curr_col)
      #move forward 1 or 2 squares
      if col==0&&board.empty_square?(square)
        moveset << square
      #capture enemy piece diagonally
      elsif col!=0&&opponent_piece?(square)
        moveset << square
      end
    end
    moveset
  end

  def check_enpassant
    return unless (colour=="white"&&position[0]==4)||(colour=="black"&&position[0]==5)
  end
end