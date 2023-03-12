require_relative '../piece_paths.rb'
require_relative './MovePiece.rb'
class Board
  include MovePiece
  attr_reader :board, :input, :capture_counter

  def self.start_chess  
    board1 = self.new
    8.times do |col|
      board1[[1,col]] = Pawn.new([1,col],"white",board1)
      board1[[6,col]] = Pawn.new([6,col],"black",board1)
    end

    row_colour_pair = [[0,"white"], [7,"black"]]
    row_colour_pair.each do |(row,colour)|
      board1[[row,3]] = King.new([row,3],colour,board1)
      board1[[row,4]] = Queen.new([row,4],colour,board1)
      board1[[row,0]] = Rook.new([row,0],colour,board1)
      board1[[row,7]] = Rook.new([row,7],colour,board1)
      board1[[row,1]] = Knight.new([row,1],colour,board1)
      board1[[row,6]] = Knight.new([row,6],colour,board1)
      board1[[row,2]] = Bishop.new([row,2],colour,board1)
      board1[[row,5]] = Bishop.new([row,5],colour,board1)
      end
    board1
  end
  
  def initialize
    @board = Array.new(8) {Array.new(8)}
    @input = nil
    @capture_counter=0 #50 move rule when counter equals 100
  end
  def [](position) #get position
    row, column = position
    board[row][column]
  end
  def []=(position,piece) #set position
    row, column = position
    board[row][column] = piece
  end
  def empty_square?(position)
    row, column = position
    board[row][column].nil?
  end
  def all_pieces
    piece_list=board.flatten
    piece_list.select {|piece| piece!=nil}
  end
  def dummy
    dummy_board = Board.new
    piece_list=all_pieces
    piece_list.each do |piece|
      dummy_piece = piece.class.new(piece.position, piece.colour,dummy_board)
      dummy_board[dummy_piece.position] = dummy_piece
    end
    dummy_board
  end
  def reset_capture_counter
    @capture_counter=0
  end
  def increment_capture_counter
    @capture_counter+=1
  end
  def get_capture_counter
    @capture_counter
  end
end