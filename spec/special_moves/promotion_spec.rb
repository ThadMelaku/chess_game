require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do

    context 'Queen promotion' do
      let(:board) {Board.start_chess}
      let(:d) {DisplayBoard.new(board)}
      before do
        board.promotion_input("Q")
      end
      it 'pawn can promote to Queen' do
        clear_b_file(board)
        push_pawn_to_eight_rank(board)
        d.display
      end
    end
  end

  def push_pawn_to_eight_rank(board)
    expect(board).to receive(:puts).with("this is a valid move").exactly(6).times
    expect(board).to receive(:puts).with("checking pawn promotion").exactly(1).times
    expect(board).to receive(:puts).with("promote to queen").exactly(1).times
    board.move([1,7],[2,6])
    board.move([2,6],[3,6])
    board.move([3,6],[4,6])
    board.move([4,6],[5,6])
    board.move([5,6],[6,6])
    board.move([6,6],[7,6])
  end

  def clear_b_file(board)
    expect(board).to receive(:puts).with("this is a valid move").exactly(4).times
    board.move([7,6],[5,5])
    board.move([6,6],[4,6])
    board.move([4,6],[3,6])
    board.move([3,6],[2,6])
  end
end 