require 'spec_helper'
require_relative '../lib/queen'

RSpec.describe 'Queen' do
  describe Queen do
    context 'white queen at [7,4]' do
      subject(:queen1) {described_class.new([7,4],"white")}

      it 'queen colour should be white' do
        expect(queen1.colour).to eq("white")
      end
      it 'queen position should be [7,4]' do
        expect(queen1.position).to eq([7,4])
      end
      it 'queen possible moves' do
        expect(queen1.possible_moves.sort).to eq([[0, 4], [1, 4], [2, 4], [3, 0], [3, 4], [4, 1], [4, 4], [4, 7], [5, 2], [5, 4], [5, 6], [6, 3], [6, 4], [6, 5], [7, 0], [7, 1], [7, 2], [7, 3], [7, 5], [7, 6], [7, 7]].sort)
      end
    end

    context 'black queen at [0,4]' do
      subject(:queen2) {described_class.new([0,4],"black")}

      it 'queen colour should be white' do
        expect(queen2.colour).to eq("black")
      end
      it 'queen position should be [0,4]' do
        expect(queen2.position).to eq([0,4])
      end
      it 'queen possible moves' do
        expect(queen2.possible_moves.sort).to eq([[0, 0], [0, 1], [0, 2], [0, 3], [0, 5], [0, 6], [0, 7], [1, 3], [1, 4], [1, 5], [2, 2], [2, 4], [2, 6], [3, 1], [3, 4], [3, 7], [4, 0], [4, 4], [5, 4], [6, 4], [7, 4]].sort)
      end
    end

  end

end