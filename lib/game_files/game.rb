class Game
attr_accessor :player1, :player2, :curr_player, :board, :display_board

  def initialize(player1,player2,board,display_board)
    @player1 = player1
    @player2 = player2
    @curr_player = @player1

    @board=board
    @display_board=display_board
  end

  def play
    while true
      system("clear") || system("cls")
      display_board.display
      puts "It's #{curr_player.colour}'s turn"
      if board.in_check?(curr_player.colour)
        puts "#{curr_player.colour} is in check"
      end
      player_turn
      switch_turn
    end
    system("clear") || system("cls")
    display_board.display
    puts "Game over!"
    #puts winner
  end

  def player_turn
    #ask player to choose a piece
    while true do
      start = nil
      while start==nil
        puts "Choose a piece to move: "
        start = curr_player.player_input
      end
      empty_square = board[start].nil?
      same_colour = board[start].colour==curr_player.colour if !empty_square
      has_legal_moves = board[start].legal_moves!=[] if !empty_square

      if !empty_square && same_colour && has_legal_moves
        break
      end
      #check if piece is inbounds
      puts "The piece you chose does not have any legal moves." if !has_legal_moves
      puts "You did not choose a #{curr_player.colour} piece." if !same_colour || empty_square
      p start
    end
    #Ask player to choose target
    while true do
      puts "Choose a target square "
      target = curr_player.player_input
      
      if board.move(start, target)
        break
      end
    end
  end

  def switch_turn
    self.curr_player = (curr_player==player1 ? player2 : player1)
  end

end