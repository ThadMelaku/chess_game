require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do
    context 'castle kingside' do
      let(:board) {Board.start_chess}
      let(:d) {DisplayBoard.new(board)}
      it 'castling should be illegal' do
        expect(board).to receive(:puts).with("enter a valid move").exactly(1).times
        board.move([0,3],[0,1])
        #d.display
      end 
      it 'castling should be legal' do
        move_kingside_pieces(board)
        castle_kingside_white(board)
        king_rook_are_castled_kingside(board)
        king_rook_are_not_in_initial_position(board)
        #d.display
      end
    end
    context 'castle kingside' do
      let(:board) {Board.start_chess}
      let(:d) {DisplayBoard.new(board)}

      it 'cannot castle through check' do
        black_queen_b5(board)
        move_kingside_pieces(board)
        kingside_check_white(board)
        king_rook_are_in_initial_position(board)
        #d.display
      end
    end
  end
  #make kingside clear for castling
  def move_kingside_pieces(board)
    expect(board).to receive(:puts).with("this is a valid move").exactly(4).times
    board.move([1,3],[2,3])
    board.move([1,1],[2,1])
    board.move([0,2],[1,1])
    board.move([0,1],[2,0])
  end
  def castle_kingside_white(board)
    expect(board).to receive(:puts).with("king can castle").exactly(1).times
    board.move([0,3],[0,1])
  end
  def king_rook_are_castled_kingside(board)
    expect(board[[0,1]].class.name).to eq("King")
    expect(board[[0,2]].class.name).to eq("Rook")
  end
  def king_rook_are_not_in_initial_position(board)
    expect(board[[0,1]].initial_position).to be(false)
    expect(board[[0,2]].initial_position).to be(false)
  end
  def king_rook_are_in_initial_position(board)
    expect(board[[0,0]].initial_position).to be(true)
    expect(board[[0,3]].initial_position).to be(true)
  end
  def kingside_check_white(board) #passes through check
    expect(board).to receive(:puts).with("enter a valid move").exactly(1).times
    board.move([0,3],[0,1])
  end
  def black_queen_b5(board)
    expect(board).to receive(:puts).with("this is a valid move").exactly(3).times
    board.move([6,5],[4,5])
    board.move([7,4],[4,7])
    board.move([4,7],[4,6])
  end
end