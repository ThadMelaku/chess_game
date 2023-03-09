class Player
  attr_accessor :colour
  def initialize(colour)
    @colour=colour
  end

  def player_input
    input=gets.chomp
    
    #check if it contains a ',' else go back
    input=input.split(",")

    #input.length==2
    #input[0].length==1&&input[1].length==1
    #regular expression match: integer comma integer
    input=input.map(&:to_i)
    
  end
  
end