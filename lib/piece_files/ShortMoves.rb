#possible moves to empty squares or squares with enemy pieces
module ShortMoves
  def possible_moves
    moveset=[]
    all_moves.each do |(row,col)|
    curr_row, curr_col = position
    curr_row += row
    curr_col += col
    square = [curr_row, curr_col]
      next if !self.between_0_and_7(curr_row,curr_col)
      if board.empty_square?(square) || opponent_piece?(square)
        moveset << square
      end
    end
    moveset
  end
end
