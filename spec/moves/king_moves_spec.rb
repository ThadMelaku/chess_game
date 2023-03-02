require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do
    context 'king moves' do
      let(:board) {Board.start_chess} 

      it 'king can move to empty square' do
        expect(board).to receive(:puts).with("this is a valid move").twice
        board.move([1,3],[3,3]) #move pawn to e4
        board.move([0,3],[1,3]) #move king to e3
      end
    end

    context 'king fail move' do 
      let(:board) {Board.start_chess} 

      it 'king cannot go to square, passing through same colour piece' do
        expect(board).to receive(:puts).with("enter a valid move")
        board.move([0,3],[1,3]) #can't move king to e3, pawn in the way
      end

    end
    context 'king capture' do
      let(:board) {Board.start_chess} 
      it 'king can capture enemy piece' do
        move_black_pawn_to_h4(board)

        expect(board).to receive(:puts).with("this is a valid move").exactly(4).times
        board.move([1,2],[3,2]) #move pawn to f4
        board.move([0,3],[1,2])
        board.move([1,2],[2,1])
        board.move([2,1],[3,1])#king capture pawn on g3
        
      end
    end
  end
    
  def move_black_pawn_to_h4(board)
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([6,1],[4,1])
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([4,1],[3,1])
    
  end
end