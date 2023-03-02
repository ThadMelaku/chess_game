module LongMoves
  #possible moves to empty squares or squares with enemy pieces
  def possible_moves
    moveset=[]
    all_moves.each do |(row,col)|
      curr_row, curr_col = position

      while true do
        curr_row += row
        curr_col += col
        square = [curr_row, curr_col]
        break if !self.between_0_and_7(curr_row,curr_col)
        if board.empty_square?(square)
          moveset << square
        elsif opponent_piece?(square)
          moveset << square
          break
        else
          break
        end
      end
    end
    moveset
  end
end