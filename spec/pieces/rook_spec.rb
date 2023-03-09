require_relative '../../lib/piece_files/rook'

RSpec.describe 'Rook' do
  describe Rook do
    context 'white rook at [7,0]' do
      let(:board) {Board.new} 
      subject(:rook1) {described_class.new([7,0],"white",board)}

      it 'rook initial_position should be true' do
        expect(rook1.initial_position).to be(true)
      end
      it 'rook colour should be white' do
        expect(rook1.colour).to eq("white")
      end
      it 'rook position should be [7,0]' do
        expect(rook1.position).to eq([7,0])
      end
      it 'rook possible moves' do
        expect(rook1.possible_moves.sort).to eq([[0, 0], [1, 0], [2, 0], [3, 0],[4, 0], [5, 0], [6, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7]].sort)
      end
    end

    context 'black at [0,0]' do
      let(:board) {Board.new} 
      subject(:rook2) {described_class.new([0,0],"black",board)}

      it 'rook initial_position should be true' do
        expect(rook2.initial_position).to be(true)
      end
      it 'rook colour should be black' do
        expect(rook2.colour).to eq("black")
      end
      it 'rook position should be [0,0]' do
        expect(rook2.position).to eq([0,0])
      end
      it 'rook possible moves' do
        expect(rook2.possible_moves.sort).to eq([[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]].sort)
      end
    end

  end

end