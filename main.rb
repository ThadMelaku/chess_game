require_relative './lib/board_paths.rb'
require_relative './lib/piece_paths.rb'
require_relative './lib/game_paths.rb'

b = Board.start_chess
d = DisplayBoard.new(b)
player1 = Player.new("white")
player2 = Player.new("black")

g = Game.new(player1,player2,b,d)
g.play

#d.display