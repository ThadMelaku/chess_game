require_relative '../../lib/board_paths.rb'
require_relative '../../lib/game_paths.rb'

RSpec.describe 'Player' do
  describe Player do
    context 'player has correct colour' do
        context "p1 colour should be white" do
          subject(:p1) {Player.new("white")}
          it "p1 is white" do
            expect(p1.colour).to eq("white")
          end
        end
        context "p2 colour should be black" do
          subject(:p2) {Player.new("black")}
          it "p2 is black" do
            expect(p2.colour).to eq("black")
          end
        end
    end
    context 'player_input testing' do
      context 'a2 is a valid input' do
        subject(:p1) {Player.new("white")}
        before do
          allow(p1).to receive(:puts)
          allow(p1).to receive(:gets).and_return("a2")
        end

        it 'a2 is a valid inout' do
          expect(p1.player_input).to eq([1,7])
        end

      end
      context 'invalid input, then exit' do
        subject(:p1) {Player.new("white")}
        before do
          allow(p1).to receive(:puts)
          allow(p1).to receive(:gets).and_return("3a","exit")
        end

        it '3a is invalid, should be letter then number' do
          expect(p1.player_input).to eq("exit")
        end
      end
      context 'more than 2 characters is invalid' do
        subject(:p1) {Player.new("white")}
        before do
          allow(p1).to receive(:puts)
          allow(p1).to receive(:gets).and_return("3a4sdfs","exit")
        end

        it '3a4sdfs is invalid, should be only 2 chars long' do
          expect(p1.player_input).to eq("exit")
        end
      end
      context 'numbers only is invalid' do
        subject(:p1) {Player.new("white")}
        before do
          allow(p1).to receive(:puts)
          allow(p1).to receive(:gets).and_return("33","exit")
        end

        it '33 is invalid' do
          expect(p1.player_input).to eq("exit")
        end
      end
      context 'invalid input,then valid, then exit' do
        subject(:p1) {Player.new("white")}
        before do
          allow(p1).to receive(:puts)
          allow(p1).to receive(:gets).and_return("ab","d4","exit")  
        end

        it 'd4 is a valid input' do
          expect(p1.player_input).to eq([3,4])
          expect(p1.player_input).to eq("exit")
        end
      end
      context 'capital letters work' do
        subject(:p1) {Player.new("white")}
        before do
          allow(p1).to receive(:puts)
          allow(p1).to receive(:gets).and_return("D5","C6")  
        end

        it 'D5 and C6 are valid' do
          expect(p1.player_input).to eq([4,4])
          expect(p1.player_input).to eq([5,5])
        end
      end
    end
  end
end