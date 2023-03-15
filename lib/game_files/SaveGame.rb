require "yaml"
require_relative '../board_files/board.rb'
module SaveGame
  def ask_to_save_game
    puts "Enter 's' to save and exit, input anything else to exit without saving"
    save_input = gets.chomp.downcase
    if save_input == "s"
      puts "Saving game"
      save_game
    elsif File.exists?("saved_board.yml")
      puts "Deleting save file"
      File.delete("saved_board.yml")
    end
  end
  def save_game
    hash = {
      board: board, 
      display_board: display_board, 
      curr_player: curr_player, 
      player1: player1, 
      player2: player2
    } 
    output = File.new("saved_board.yml","w")
    output.puts YAML.dump(hash)
    output.close 
  end
  def ask_to_load_game
    puts "Enter 'p' to load the previous saved game, input anything else to start a new game"
    load_input = gets.chomp.downcase
    if load_input == "p"
      load_game 
      return true
    end
    false
  end
  def load_game
    hash = YAML.safe_load_file("saved_board.yml", aliases: true, permitted_classes: [Board,DisplayBoard,Player,Symbol,Rook,Knight,Bishop,Queen,King,Pawn])
    @board = hash[:board]
    @display_board = hash[:display_board]
    @curr_player = hash[:curr_player]
    @player1 = hash[:player1]
    @player2 = hash[:player2]
  end

end