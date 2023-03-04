require 'spec_helper'
require_relative '../lib/piece_files/knight'

RSpec.describe 'Knight' do
  describe Knight do
    context 'white knight at [7,1]' do
      let(:board) {Board.new} 
      subject(:knight1) {described_class.new([7,1],"white",board)}
      it 'knight colour should be white' do
        expect(knight1.colour).to eq("white")
      end
      it 'knight position should be [7,1]' do
        expect(knight1.position).to eq([7,1])
      end
      it 'knight possible moves should be [6,3] [5,2] [5,0]' do
        expect(knight1.possible_moves.sort).to eq([[6, 3], [5, 0], [5, 2]].sort)
      end

    end
    context 'black knight at [0,1]' do
      let(:board) {Board.new} 
      subject(:knight2) {described_class.new([0,1],"black",board)}
      it 'knight colour should be black' do
        expect(knight2.colour).to eq("black")
      end
      it 'knight position should be [0,1]' do
        expect(knight2.position).to eq([0,1])
      end
      it 'knight possible moves should be [1,3] [2,2] [2,0]' do
        expect(knight2.possible_moves.sort).to eq([[1, 3], [2, 2], [2, 0]].sort)
      end

    end
  end
end