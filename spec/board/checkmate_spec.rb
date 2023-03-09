require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do

    context 'Not checkmate' do
      subject(:board) {Board.start_chess}
      let(:d) {DisplayBoard.new(board)}

      it 'white is not checkmated' do
        expect(board.checkmate?("white")).to be(false)
      end
      it 'black is not checkmated' do
        expect(board.checkmate?("black")).to be(false)
      end
    end

    context 'In check, but not checkmate' do
      subject(:board) {Board.new}
      let(:d) {DisplayBoard.new(board)}

      it 'white in check' do
        white_in_check(board)
        expect(board.in_check?("white")).to be(true)
        expect(board.checkmate?("white")).to be(false)
        #d.display
      end
      it 'black in check' do
        black_in_check(board)
        expect(board.in_check?("black")).to be(true)
        expect(board.checkmate?("black")).to be(false)
        #d.display
      end
    end
    context 'Checkmated' do
      subject(:board) {Board.new}
      let(:d) {DisplayBoard.new(board)}

      it 'white checkmated' do
        white_checkmated(board)
        expect(board.in_check?("white")).to be(true)
        expect(board.checkmate?("white")).to be(true)
        #d.display
      end
      it 'black checkmated' do
        black_checkmated(board)
        expect(board.in_check?("black")).to be(true)
        expect(board.checkmate?("black")).to be(true)
        #d.display
      end
    end
    context 'Not in check, and no legal moves(stalemate)' do
      subject(:board) {Board.new}
      let(:d) {DisplayBoard.new(board)}

      it 'white stalemated' do
        white_stalemated(board)
        expect(board.in_check?("white")).to be(false)
        expect(board.checkmate?("white")).to be(false)
        #d.display
      end
      it 'black stalemated' do
        black_stalemated(board)
        expect(board.in_check?("black")).to be(false)
        expect(board.checkmate?("black")).to be(false)
        #d.display
      end
    end
    
    def white_in_check(board)
      board[[0,3]] = King.new([0,3],"white",board)
      board[[7,3]] = King.new([7,3],"black",board)
      board[[0,5]] = Queen.new([0,5],"black",board)
    end
    def black_in_check(board)
      board[[0,3]] = King.new([0,3],"white",board)
      board[[7,3]] = King.new([7,3],"black",board)
      board[[7,5]] = Queen.new([7,5],"white",board)
    end
    def white_checkmated(board)
      board[[0,0]] = King.new([0,0],"white",board)
      board[[2,2]] = King.new([2,2],"black",board)
      board[[1,1]] = Queen.new([1,1],"black",board)
      board[[7,7]] = Rook.new([7,7],"white",board)
    end
    def black_checkmated(board)
      board[[5,3]] = King.new([5,3],"white",board)
      board[[7,3]] = King.new([7,3],"black",board)
      board[[6,3]] = Pawn.new([6,3],"white",board)
      board[[6,2]] = Pawn.new([6,2],"white",board)
    end
    def white_stalemated(board)
      board[[0,0]] = King.new([0,0],"white",board)
      board[[7,3]] = King.new([7,3],"black",board)
      board[[1,2]] = Queen.new([1,2],"black",board)
    end
    def black_stalemated(board)
      board[[5,3]] = King.new([5,3],"white",board)
      board[[7,3]] = King.new([7,3],"black",board)
      board[[6,3]] = Pawn.new([6,3],"white",board)
    end
  end

end