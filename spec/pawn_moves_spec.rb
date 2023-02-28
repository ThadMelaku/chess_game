require_relative '../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do
    context 'pawn forward moves' do
      let(:board) {Board.start_chess} 

      it 'pawn can move forward 1 square if empty square' do
        expect(board[[1,1]].class.name=="Pawn")
        expect(board[[2,1]].class.name==nil)
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([1,1],[2,1])
        expect(board[[1,1]].class.name==nil)
        expect(board[[2,1]].class.name=="Pawn")
      end
      it 'pawn can move forward 2 squares if squares are empty' do
        expect(board[[1,1]].class.name=="Pawn")
        expect(board[[2,1]].class.name==nil)
        expect(board[[3,1]].class.name==nil)
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([1,1],[3,1])
        expect(board[[1,1]].class.name==nil)
        expect(board[[2,1]].class.name==nil)
        expect(board[[3,1]].class.name=="Pawn")
      end
      it 'pawn cannot move forward 1 square if square occupied' do
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([0,1],[2,0]) #move knight in front of pawn

        expect(board[[1,0]].class.name=="Pawn")
        expect(board[[2,0]].class.name=="Knight")

        expect(board).to receive(:puts).with("enter a valid move")
        board.move([1,0],[2,0])

        expect(board[[1,0]].class.name=="Pawn")
        expect(board[[2,0]].class.name=="Knight")
      end
      it 'pawn cannot move forward 2 squares if squares occupied' do
        expect(board).to receive(:puts).with("this is a valid move")
        board.move([0,1],[2,0]) #move knight in front of pawn
        
        expect(board[[1,0]].class.name=="Pawn")
        expect(board[[2,0]].class.name=="Knight")
        expect(board[[3,0]].class.name==nil)

        expect(board).to receive(:puts).with("enter a valid move")
        board.move([1,0],[3,0])

        expect(board[[1,0]].class.name=="Pawn")
        expect(board[[2,0]].class.name=="Knight")
        expect(board[[3,0]].class.name==nil)

      end
    end

    context 'pawn diagonal moves' do
      let(:board) {Board.start_chess} 

      it 'pawn can capture diagonally if there is an opponent piece' do
        move_black_pawn_to_h3(board)
        
        expect(board[[1,0]].class.name=="Pawn")
        expect(board[[1,0]].colour=="white")
        expect(board[[2,1]].class.name=="Pawn")
        expect(board[[2,1]].colour=="black")

        expect(board).to receive(:puts).with("this is a valid move")
        board.move([1,0],[2,1])

        expect(board[[1,0]].class.name==nil)
        expect(board[[2,1]].class.name=="Pawn")
        expect(board[[2,1]].colour=="white")
      end
      it 'pawn cannot capture diagonally if empty square' do
        expect(board[[1,0]].class.name=="Pawn")
        expect(board[[1,0]].colour=="white")
        expect(board[[2,1]].class.name==nil)

        expect(board).to receive(:puts).with("enter a valid move")
        board.move([1,0],[2,1])

        expect(board[[1,0]].class.name=="Pawn")
        expect(board[[1,0]].colour=="white")
        expect(board[[2,1]].class.name==nil)
      end
    end
  end
  def move_black_pawn_to_h3(board)
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([6,1],[4,1])
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([4,1],[3,1])
    expect(board).to receive(:puts).with("this is a valid move")
    board.move([3,1],[2,1])
  end
end
