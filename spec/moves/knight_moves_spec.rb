require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do
    context 'knight moves' do
      let(:board) {Board.start_chess} 

      it 'knight can move to empty square' do
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([0,1],[2,0]) #move knight in front of pawn
      end
    end

    context 'knight fail move' do 
      let(:board) {Board.start_chess} 

      it 'knight cannot move to square occupied by same colour piece' do
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([1,0],[2,0])

        expect(board).to receive(:puts).with("enter a valid move")
        board.move([0,1],[2,0])
      end

    end
    context 'knight capture' do
      let(:board) {Board.start_chess} 
      it 'knight can capture enemy piece' do
        move_black_pawn_to_h3(board)

        expect(board).to receive(:puts).with("this is a valid move")
        board.move([0,1],[2,0])
      end
    end
  end
    
  def move_black_pawn_to_h3(board)
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([6,0],[4,0])
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([4,0],[3,0])
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([3,0],[2,0])
  end
end
