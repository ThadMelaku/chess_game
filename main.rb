require_relative './lib/board_paths.rb'

b = Board.start_chess
d = DisplayBoard.new(b)
d.display