class DisplayBoard
  attr_accessor :board
  def initialize(board)
    @board = board
  end

  def display
    num=1
    puts "\n  -----------------"
    8.times do |row|
      print "#{num} |"
      8.times do |col|
        piece = board[[row, col]]
        if piece
          print "#{@board[[row, col]]}|"
        else
          print " |"
        end 
      end
      puts "\n  -----------------"
      num+=1
    end
    puts "   H G F E D C B A "
  end
end
