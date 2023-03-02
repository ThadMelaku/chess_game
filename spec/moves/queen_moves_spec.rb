require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do
    context 'queen moves' do
      let(:board) {Board.start_chess} 

      it 'queen can move to empty square' do
        expect(board).to receive(:puts).with("this is a valid move").twice
        board.move([1,3],[3,3]) #move pawn to e4
        board.move([0,4],[4,0]) #move queen to h5
      end
    end

    context 'queen fail move' do 
      let(:board) {Board.start_chess} 

      it 'queen cannot go to square, passing through same colour piece' do
        expect(board).to receive(:puts).with("enter a valid move")
        board.move([0,4],[4,0]) #can't move queen to h5, pawn in the way
      end

    end
    context 'queen capture' do
      let(:board) {Board.start_chess} 
      it 'queen can capture enemy piece' do
        move_black_pawn_to_h5(board)

        expect(board).to receive(:puts).with("this is a valid move").twice
        board.move([1,3],[3,3]) #move pawn to e4
        board.move([0,4],[4,0]) #queen capture pawn on h5
      end
    end
  end
    
  def move_black_pawn_to_h5(board)
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([6,0],[4,0])
  end
end