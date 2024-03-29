require_relative "SaveGame"
class Game
  include SaveGame
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
    @hash={}
  end

  def play
    game_loaded=ask_to_load_game if File.exists?("saved_board.yml")
    while true
      unless game_loaded == true
        puts "Would you like to start a new game? [y/n]"
        break unless curr_player.play_again_input #break if user inputs 'n'
        setup_variables
      end 

      while !game_over?(game_loaded)
        puts "It's #{curr_player.colour}'s turn"
        if board.in_check?(curr_player.colour)
          puts "#{curr_player.colour} is in check"
        end
        break if player_turn==false
        switch_turn
      end
      game_loaded=false
    end
    ask_to_save_game
    puts "Thanks for playing!"
  end
  def game_over?(game_loaded)
    system("clear") || system("cls")
    display_board.display
    return false if game_loaded #saved game just loaded, no checks needed
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
    #3-fold-repetition, same board position has occurred 3 times
    if board.three_fold_repetition
      puts "The same position has been repeated three times! The game is a draw"
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
      #Invalid square output messages
      if empty_square
        puts "#{curr_player.get_current_input} is an empty square"
      elsif !same_colour
        puts "The piece on #{curr_player.get_current_input} is not a #{curr_player.colour} piece."
      elsif !has_legal_moves
        puts "The piece on #{curr_player.get_current_input} does not have any legal moves."
      end
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
      return true if board.move(start, target)
    end
  end
  def switch_turn
    self.curr_player = (curr_player==player1 ? player2 : player1)
  end
end