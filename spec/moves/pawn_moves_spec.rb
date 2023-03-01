require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do
    context 'pawn forward moves' do
      let(:board) {Board.start_chess} 

      it 'pawn can move forward 1 square if empty square' do
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([1,1],[2,1])
      end

    end
    context 'pawn forward moves' do
      let(:board) {Board.start_chess} 
      it 'pawn can move forward 2 squares if squares are empty' do
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([1,1],[3,1])
      end
    end
    context 'pawn forward moves' do
      let(:board) {Board.start_chess} 
      it 'pawn cannot move forward 1 square if square occupied' do
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([0,1],[2,0]) #move knight in front of pawn

        expect(board).to receive(:puts).with("enter a valid move")
        board.move([1,0],[2,0])

      end
    end
    context 'pawn forward moves' do
      let(:board) {Board.start_chess} 
      it 'pawn cannot move forward 2 squares if squares occupied' do
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([0,1],[2,0]) #move knight in front of pawn

        expect(board).to receive(:puts).with("enter a valid move")
        board.move([1,0],[3,0])

      end
    end
    context 'pawn diagonal moves' do
      let(:board) {Board.start_chess} 

      it 'pawn can capture diagonally if there is an opponent piece' do
        move_black_pawn_to_g3(board)
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([1,0],[2,1])
      end
    end
    context 'pawn diagonal moves' do
      let(:board) {Board.start_chess} 
      it 'pawn cannot capture diagonally if empty square' do
        expect(board).to receive(:puts).with("enter a valid move")
        board.move([1,0],[2,1])
      end
    end
  end
  def move_black_pawn_to_g3(board)
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([6,1],[4,1])
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([4,1],[3,1])
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([3,1],[2,1])
  end
end
