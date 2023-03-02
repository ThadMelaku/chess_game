require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do
    context 'rook moves' do
      let(:board) {Board.start_chess} 

      it 'rook can move to empty square' do
        expect(board).to receive(:puts).with("this is a valid move").twice
        board.move([1,0],[3,0]) #move pawn to h4
        board.move([0,0],[2,0]) #move rook to h3
      end
    end

    context 'rook fail move' do 
      let(:board) {Board.start_chess} 

      it 'rook cannot go to square, passing through same colour piece' do
        expect(board).to receive(:puts).with("enter a valid move")
        board.move([0,0],[2,0]) #can't move rook to h3, pawn in the way
      end

    end
    context 'rook capture' do
      let(:board) {Board.start_chess} 
      it 'rook can capture enemy piece' do
        move_black_pawn_to_g3(board)

        expect(board).to receive(:puts).with("this is a valid move").exactly(3).times
        board.move([1,0],[3,0]) #move pawn to D4
        board.move([0,0],[2,0]) #move rook to h3
        board.move([2,0],[2,1]) #rook capture pawn on g3
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