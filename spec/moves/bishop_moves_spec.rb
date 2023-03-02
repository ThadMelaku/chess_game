require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do
    context 'bishop moves' do
      let(:board) {Board.start_chess} 

      it 'bishop can move to empty square' do
        expect(board).to receive(:puts).with("this is a valid move").twice
        board.move([1,4],[3,4]) #move pawn to D4
        board.move([0,5],[5,0]) #move bishop to h6
      end
    end

    context 'bishop fail move' do 
      let(:board) {Board.start_chess} 

      it 'bishop cannot go to square, passing through same colour piece' do
        expect(board).to receive(:puts).with("enter a valid move")
        board.move([0,5],[5,0]) #can't move bishop to h6, pawn in the way
      end

    end
    context 'bishop capture' do
      let(:board) {Board.start_chess} 
      it 'bishop can capture enemy piece' do
        move_black_pawn_to_h6(board)

        expect(board).to receive(:puts).with("this is a valid move").twice
        board.move([1,4],[3,4]) #move pawn to D4
        board.move([0,5],[5,0]) #capture pawn on h6
      end
    end
  end
    
  def move_black_pawn_to_h6(board)
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([6,0],[5,0])
  end
end