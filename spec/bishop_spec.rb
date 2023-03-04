require 'spec_helper'
require_relative '../lib/piece_files/bishop'

RSpec.describe 'Bishop' do
  describe Bishop do
    context 'white bishop at [7,2]' do
      let(:board) {Board.new} 
      subject(:bishop1) {described_class.new([7,2],"white",board)}

      it 'bishop colour should be white' do
        expect(bishop1.colour).to eq("white")
      end
      it 'bishop position should be [7,2]' do
        expect(bishop1.position).to eq([7,2])
      end
      it 'bishop possible moves should be [2, 7], [3, 6], [4, 5], [5, 0], [5, 4], [6, 1], [6, 3]' do
        expect(bishop1.possible_moves.sort).to eq([[2, 7], [3, 6], [4, 5], [5, 0], [5, 4], [6, 1], [6, 3]].sort)
      end
    end

    context 'black bishop at [0,2]' do
      let(:board) {Board.new} 
      subject(:bishop2) {described_class.new([0,2],"white",board)}
      
      it 'bishop colour should be white' do
        expect(bishop2.colour).to eq("white")
      end
      it 'bishop position should be [0,2]' do
        expect(bishop2.position).to eq([0,2])
      end
      it 'bishop possible moves should be [[1, 1], [1, 3], [2, 0], [2, 4], [3, 5], [4, 6], [5, 7]]' do
        expect(bishop2.possible_moves.sort).to eq([[1, 1], [1, 3], [2, 0], [2, 4], [3, 5], [4, 6], [5, 7]].sort)
      end
    end
  end

end