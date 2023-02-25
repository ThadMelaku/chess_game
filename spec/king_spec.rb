require 'spec_helper'
require_relative '../lib/king'

RSpec.describe 'King' do
  describe King do
    context 'white king at [7,3]' do
      subject(:king1) {described_class.new([7,3],"white")}

      it 'king colour should be white' do
        expect(king1.colour).to eq("white")
      end
      it 'king position should be [7,3]' do
        expect(king1.position).to eq([7,3])
      end
      it 'king possible moves should be [6, 3],[6,2],[6,4],[7,4],[7,2]' do
        expect(king1.possible_moves.sort).to eq([[6, 3],[6,2],[6,4],[7,4],[7,2]].sort)
      end
    end

    context 'black king at [0,3]' do
      subject(:king2) {described_class.new([0,3],"black")}

      it 'king colour should be black' do
        expect(king2.colour).to eq("black")
      end
      it 'king position should be [0,3]' do
        expect(king2.position).to eq([0,3])
      end
      it 'king possible moves should be [1,3],[1,2],[1,4],[0,4],[0,2]' do
        expect(king2.possible_moves.sort).to eq([[1,3],[1,2],[1,4],[0,4],[0,2]].sort)
      end
    end

  end
end