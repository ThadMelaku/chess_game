require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do

    context 'Queen promotion' do
      subject(:board) {Board.start_chess}
      let(:d) {DisplayBoard.new(board)}
      before do
        board.promotion_input("Q")
        allow(board).to receive(:puts)
      end
      it 'pawn can promote to Queen' do
        clear_b_file(board)
        push_pawn_to_seventh_rank(board)
        board.move([6,6],[7,6])
        #d.display
      end
    end
    context 'Queen cant promote' do
      subject(:board) {Board.start_chess}
      let(:d) {DisplayBoard.new(board)}
      before do
        board.promotion_input("Q")
        allow(board).to receive(:puts)
      end
      it 'king will be in check' do
        king_to_a5(board)
        clear_b_file(board)
        push_pawn_to_seventh_rank(board)
        king_to_a6(board)

        board.move([6,6],[7,6]) #try to promote pawn
        #d.display
      end
    end
    context 'Rook promotion' do
      subject(:board) {Board.start_chess}
      let(:d) {DisplayBoard.new(board)}
      before do
        board.promotion_input("R")
        allow(board).to receive(:puts)
      end
      it 'pawn can promote to Rook' do
        clear_b_file(board)
        push_pawn_to_seventh_rank(board)
        board.move([6,6],[7,6])
        #d.display
      end
    end
    context 'Bishop promotion' do
      subject(:board) {Board.start_chess}
      let(:d) {DisplayBoard.new(board)}
      before do
        board.promotion_input("B")
        allow(board).to receive(:puts)
      end
      it 'pawn can promote to Bishop' do
        clear_b_file(board)
        push_pawn_to_seventh_rank(board)
        board.move([6,6],[7,6])
        #d.display
      end
    end
    context 'Knight promotion' do
      subject(:board) {Board.start_chess}
      let(:d) {DisplayBoard.new(board)}
      before do
        board.promotion_input("N")
        allow(board).to receive(:puts)
      end
      it 'pawn can promote to Knight' do
        clear_b_file(board)
        push_pawn_to_seventh_rank(board)
        board.move([6,6],[7,6])
        #d.display
      end
    end
  end
  def push_pawn_to_seventh_rank(board)
    board.move([1,7],[2,6])
    board.move([2,6],[3,6])
    board.move([3,6],[4,6])
    board.move([4,6],[5,6])
    board.move([5,6],[6,6])
  end
  def clear_b_file(board)
    board.move([7,6],[5,5])
    board.move([6,6],[4,6])
    board.move([4,6],[3,6])
    board.move([3,6],[2,6])
  end
  def king_to_a5(board)
    board.move([1,4],[3,4])
    board.move([0,3],[1,4])
    board.move([1,4],[2,5])
    board.move([2,5],[3,5])
    board.move([3,5],[4,5])
  end
  def king_to_a6(board)
    board.move([5,5],[4,3])
    board.move([4,5],[4,6])
    board.move([4,6],[4,7])
    board.move([4,7],[5,7])
  end
end 