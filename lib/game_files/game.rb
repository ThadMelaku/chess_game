class Game
attr_accessor :player1, :player2, :curr_player, :board, :display_board

  def initialize
    setup_variables
  end
  def setup_variables
    b = Board.start_chess
    d = DisplayBoard.new(b)
    p1 = Player.new("white")
    p2 = Player.new("black")

    @player1 = p1
    @player2 = p2
    @curr_player = @player1
    @board=b
    @display_board=d
  end

  def play
    while true
      puts "Would you like to start a new game? [y/n]"
      break unless curr_player.play_again_input
      setup_variables

      while !game_over?
        puts "It's #{curr_player.colour}'s turn"
        if board.in_check?(curr_player.colour)
          puts "#{curr_player.colour} is in check"
        end
        break if player_turn==false
        switch_turn
      end
    end
    puts "Thanks for playing!"
  end
  def game_over?
    system("clear") || system("cls")
    display_board.display
    #current player is checkmated
    if board.checkmate?(curr_player.colour)
      switch_turn
      puts "#{curr_player.colour} wins!"
      return true
    end
    #current player is stalemated
    if board.stalemate?(curr_player.colour)
      puts "Stalemate! The game is a draw"
      return true
    end
    #50 move rule
    if board.get_capture_counter==100
      puts "50 move rule! The game is a draw"
      return true
    else
      #puts "there have been #{board.get_capture_counter} moves without a capture"
    end
    #Not enough material to deliver checkmate
    if board.not_enough_material?("white")&&board.not_enough_material?("black")
      puts "Not enough mating material! The game is a draw"
      return true
    end
    #3-fold-repetition
    if board.three_fold_repetition
      puts "The same position has been repeted three times! The game is a draw"
      return true
    end
    false
  end

  def player_turn
    #ask player to choose a piece
    while true do
      start = nil
      while start==nil
        puts " "
        puts "Choose a piece to move: "
        start = curr_player.player_input
      end
      return false if start=="exit"
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
    return choose_target(start)
  end
  def choose_target(start)
    while true do
      puts " "
      puts "Choose a target square: "
      target = curr_player.player_input
      return false if target=="exit"
      if board.move(start, target)
        return true
      end
    end
  end
  def switch_turn
    self.curr_player = (curr_player==player1 ? player2 : player1)
  end
end