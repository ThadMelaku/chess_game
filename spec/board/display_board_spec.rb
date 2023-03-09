require_relative '../../lib/board_paths.rb'

RSpec.describe 'DisplayBoard' do
  describe DisplayBoard do
    describe '#display' do      
      subject(:displayboard1) {described_class.new(Board.start_chess)}
        it 'displays the board' do
          expect(displayboard1).to receive(:puts).exactly(10).times #8 dividers for the top and bottom of each row
          expect(displayboard1).to receive(:print).exactly(72).times # 8 '|'s plus 64 '#{square}|'s equals 72 
          displayboard1.display
        end
    end
  end
end