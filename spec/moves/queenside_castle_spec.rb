require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do
    context 'castle queenside' do
      let(:board) {Board.start_chess}
      let(:d) {DisplayBoard.new(board)}
      it 'castling should be illegal' do
        expect(board).to receive(:puts).with("enter a valid move").exactly(1).times
        board.move([0,3],[0,5])
        #d.display
      end 
      it 'castling should be legal' do
        move_queenside_pieces(board)
        castle_queenside_white(board)
        king_rook_are_castled_queenside(board)
        king_rook_are_not_in_initial_position(board)
        #d.display
      end
    end
    context 'castle queenside' do
      let(:board) {Board.start_chess}
      let(:d) {DisplayBoard.new(board)}

      it 'cannot castle through check' do
        move_queenside_pieces(board)
        black_queen_g5(board)
        queenside_check_white(board)
        king_rook_are_in_initial_position(board)
        #d.display
      end
    end
  end
  #make queenside clear for castling
  def move_queenside_pieces(board)
    expect(board).to receive(:puts).with("this is a valid move").exactly(4).times
    board.move([1,4],[3,4])
    board.move([0,4],[2,4])
    board.move([0,5],[5,0])
    board.move([0,6],[2,7])
  end
  def castle_queenside_white(board)
    expect(board).to receive(:puts).with("king can castle").exactly(1).times
    board.move([0,3],[0,5])
  end
  def king_rook_are_castled_queenside(board)
    expect(board[[0,5]].class.name).to eq("King")
    expect(board[[0,4]].class.name).to eq("Rook")
  end
  def king_rook_are_not_in_initial_position(board)
    expect(board[[0,5]].initial_position).to be(false)
    expect(board[[0,4]].initial_position).to be(false)
  end
  def king_rook_are_in_initial_position(board)
    expect(board[[0,3]].initial_position).to be(true)
    expect(board[[0,7]].initial_position).to be(true)
  end
  def queenside_check_white(board) #passes through check
    expect(board).to receive(:puts).with("enter a valid move").exactly(1).times
    board.move([0,3],[0,5])
  end
  def black_queen_g5(board)
    expect(board).to receive(:puts).with("this is a valid move").exactly(2).times
    board.move([6,3],[4,3])
    board.move([7,4],[4,1])
  end
end