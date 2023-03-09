require_relative '../../lib/board_paths.rb'

RSpec.describe 'Board' do
  describe Board do
    describe '#initialize' do
      subject(:board1) {described_class.new}
      it 'has a 8 x 8 grid' do
        expect(board1.board[0].size).to eq(8)
        expect(board1.board.size).to eq(8)
      end
    end
    describe '"get" and "set" board position [1,1] to pawn' do
      subject(:board2) {described_class.new}
      let(:pawn) { instance_double(Pawn, position: [1,1], colour: "white", board: board2)}

      it '"set" position [1,1] to pawn, then check board at [1,1] with "get"' do
        board2[pawn.position] = pawn
        expect(board2[[1,1]]).to be(pawn)   
      end
    end
    describe '#self.start_chess' do
      subject(:board3) {described_class.start_chess}
      it 'check pawn positions' do
        ["white","black"].each do |colour|
          8.times do |col|
            check_position(board3,col,colour,"Pawn")
          end
        end
      end
      it 'check King positions' do
        ["white","black"].each do |colour|
          check_position(board3,3,colour,"King")
        end
      end
      it 'check Queen positions' do
        ["white","black"].each do |colour|
          check_position(board3,4,colour,"Queen")
        end
      end
      it 'check Rook positions' do
        ["white","black"].each do |colour|
          check_position(board3,0,colour,"Rook")
          check_position(board3,7,colour,"Rook")
        end
      end
      it 'check Knight positions' do
        ["white","black"].each do |colour|
          check_position(board3,1,colour,"Knight")
          check_position(board3,6,colour,"Knight")
        end
      end
      it 'check Bishop positions' do
        ["white","black"].each do |colour|
          check_position(board3,2,colour,"Bishop")
          check_position(board3,5,colour,"Bishop")
        end
      end
    end
    describe '#empty_square?' do
      subject(:board4) {described_class.start_chess}
      it 'position [1,1] should not be an empty square' do
        expect(board4.empty_square?([1,1])).to be(false)
      end
      it 'position[2,1] should be empty square ' do
        expect(board4.empty_square?([2,1])).to be(true)
      end
    end
  end


  def check_position(board,col,colour,piece)
    if piece == "Pawn"
      colour == "white"? row=1 : row=6
    else
      colour == "white"? row=0 : row=7
    end
    expect(board[[row,col]].class.name).to eq(piece)
    expect(board[[row,col]].position).to eq([row,col])
    expect(board[[row,col]].colour).to eq(colour)
  end
end