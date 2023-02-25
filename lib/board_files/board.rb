require_relative '../piece_paths.rb'
class Board
  attr_reader :board

  def self.start_chess  
    board1 = self.new
    8.times do |col|
      board1[[1,col]] = Pawn.new([1,col],"white")
      board1[[6,col]] = Pawn.new([6,col],"black")
    end

    row_colour_pair = [[0,"white"], [7,"black"]]
    row_colour_pair.each do |(row,colour)|
      board1[[row,3]] = King.new([row,3],colour)
      board1[[row,4]] = Queen.new([row,4],colour)
      board1[[row,0]] = Rook.new([row,0],colour)
      board1[[row,7]] = Rook.new([row,7],colour)
      board1[[row,1]] = Knight.new([row,1],colour)
      board1[[row,6]] = Knight.new([row,6],colour)
      board1[[row,2]] = Bishop.new([row,2],colour)
      board1[[row,5]] = Bishop.new([row,5],colour)
      end
    board1
  end
  
  def initialize
    @board = Array.new(8) {Array.new(8)}
  end
  def [](position) #get position
    row, column = position
    board[row][column]
  end
  def []=(position,piece) #set position
    row, column = position
    board[row][column] = piece
  end
  
end