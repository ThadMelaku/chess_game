require 'spec_helper'
require_relative '../lib/piece_files/pawn'

RSpec.describe 'Pawn' do
  describe Pawn do
    context 'white pawn at intial position [6,1]' do
      subject(:pawn1) {described_class.new([6,1],"white")}

      it 'pawn colour should be white' do
        expect(pawn1.colour).to eq("white")
      end
      it 'pawn position should be [6,1]' do
        expect(pawn1.position).to eq([6,1])
      end
      it 'pawn possible moves should be [5,1],[4,1],[5,0],[5,2]' do
        expect(pawn1.possible_moves.sort).to eq([[5,1],[4,1],[5,0],[5,2]].sort)
      end
    end
    context 'white pawn at [1,2]' do
      subject(:pawn2) {described_class.new([1,2],"white")}

      it 'pawn possible moves should be [0,2],[0,1],[0,3]' do
        expect(pawn2.possible_moves.sort).to eq([[0,2],[0,1],[0,3]].sort)
      end
    end

    context 'black pawn at intial position [1,1]' do
      subject(:pawn3) {described_class.new([1,1],"black")}

      it 'pawn colour should be black' do
        expect(pawn3.colour).to eq("black")
      end
      it 'pawn position should be [1,1]' do
        expect(pawn3.position).to eq([1,1])
      end
      it 'pawn possible moves should be [2,1],[3,1],[2,0],[2,2]' do
        expect(pawn3.possible_moves.sort).to eq([[2,1],[3,1],[2,0],[2,2]].sort)
      end
    end
    context 'black pawn at [1,2]' do
      subject(:pawn4) {described_class.new([6,2],"black")}
      
      it 'pawn possible moves should be [7,2],[7,1],[7,3]' do
        expect(pawn4.possible_moves.sort).to eq([[7,2],[7,1],[7,3]].sort)
      end
    end

  end
end