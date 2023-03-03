require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do
    context 'pawn forward moves' do
      let(:board) {Board.start_chess} 
      it 'move forward 1 square, enpassant should be false' do
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([1,1],[2,1])
        expect(board[[2,1]].en_passant).to be(false)
      end
    end
    context 'pawn forward moves' do
      let(:board) {Board.start_chess} 
      it 'move forward 2 squares, enpassant should be true' do
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([1,1],[3,1])
        expect(board[[3,1]].en_passant).to be(true)
      end
      it 'enpassant is only true if it is the most recent move' do
        expect(board).to receive(:puts).with("this is a valid move").twice
        board.move([1,6],[3,6])
        board.move([1,3],[3,3])
        expect(board[[3,6]].en_passant).to be(false)
        expect(board[[3,3]].en_passant).to be(true)
      end
    end
    context 'pawn capture enpassant' do
      let(:board) {Board.start_chess} 

      it 'pawn can capture enpassant if there is an adjacent opponent piece' do
        move_black_pawn_to_g3(board)
        expect(board).to receive(:puts).with("this is a valid move").twice
        board.move([1,2],[3,2]) #move white pawn to f3
        expect(board[[3,2]].class.name).to eq("Pawn")

        board.move([3,1],[2,2]) #move black pawn to f2
        expect(board[[3,2]]).to be(nil) #captured piece is removed from board
      end
    end
    context 'pawn cannot enpassant' do
      let(:board) {Board.start_chess} 
      it 'pawn cannot capture enpassant if enemy pawn was not just moved' do
        move_black_pawn_to_g3(board)
        expect(board).to receive(:puts).with("this is a valid move").exactly(2).times
        board.move([1,2],[3,2]) #move white pawn to f3
        expect(board[[3,2]].class.name).to eq("Pawn")
        board.move([1,5],[3,5])


        expect(board).to receive(:puts).with("enter a valid move")
        board.move([3,1],[2,2]) #move black pawn to f2
        expect(board[[3,2]].class.name).to eq("Pawn")
      end
    end
  end
  def move_black_pawn_to_g3(board)
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([6,1],[4,1])
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([4,1],[3,1])
  end
end