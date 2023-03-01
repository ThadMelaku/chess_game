require 'spec_helper'
require_relative '../lib/piece_files/pawn'

RSpec.describe 'Pawn' do
  describe Pawn do
    context 'black pawn at intial position [6,1]' do
      let(:board) {Board.new} 
      subject(:pawn1) {described_class.new([6,1],"black",board)}

      it 'pawn colour should be white' do
        expect(pawn1.colour).to eq("black")
      end
      it 'pawn position should be [6,1]' do
        expect(pawn1.position).to eq([6,1])
      end
      it 'pawn possible moves should be [5,1],[4,1]' do
        expect(pawn1.possible_moves.sort.uniq).to eq([[5,1],[4,1]].sort)
      end
    end
    context 'black pawn at [6,2]' do
      let(:board) {Board.new} 
      subject(:pawn2) {described_class.new([5,1],"black",board)}

      it 'pawn possible moves should be [4,1]' do
        expect(pawn2.possible_moves.sort.uniq).to eq([[4,1]].sort)
      end
    end

    context 'white pawn at intial position [1,1]' do
      let(:board) {Board.new} 
      subject(:pawn3) {described_class.new([1,1],"white",board)}

      it 'pawn colour should be black' do
        expect(pawn3.colour).to eq("white")
      end
      it 'pawn position should be [1,1]' do
        expect(pawn3.position).to eq([1,1])
      end
      it 'pawn possible moves should be [2,1],[3,1]' do
        expect(pawn3.possible_moves.sort.uniq).to eq([[2,1],[3,1]].sort)
      end
    end
    context 'white pawn at [1,2]' do
      let(:board) {Board.new} 
      subject(:pawn4) {described_class.new([1,2],"white",board)}
      
      it 'pawn possible moves should be [2,2],[3,2]]' do
        expect(pawn4.possible_moves.sort.uniq).to eq([[2,2],[3,2]].sort)
      end
    end
    context 'white pawn at [6,0]' do
      let(:board) {Board.new} 
      subject(:pawn4) {described_class.new([6,0],"black",board)}
      
      it 'pawn possible moves should be [2,2],[3,2]]' do
        expect(pawn4.possible_moves.sort.uniq).to eq([[5,0],[4,0]].sort)
      end
    end

  end
end