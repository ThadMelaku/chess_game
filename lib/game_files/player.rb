class Player
  attr_accessor :colour
  def initialize(colour)
    @colour=colour
  end

  def player_input
    input=gets.chomp
    coordinate = /[a-h][0-7]/i
    while coordinate.match?(input)==false && input!="exit"
      puts " "
      puts "#{input} is not valid"
      puts "Enter a letter from a to h, and a number from 1 to 8, example: 'd4'"
      puts "type 'exit' to go to the menu"

      input=gets.chomp
    end

    if input!="exit"
      puts "square is inbounds" 
      input=numerical_coordinate(input)
    end 
    input
    
  end

  def numerical_coordinate(input)
    input=input.gsub(/[a-h]/i) {|m| 104-m.downcase.ord}
    
    arr=[]
    arr[0],arr[1]=input[1],input[0]
   
    arr=arr.map(&:to_i)
    arr[0]=arr[0]-1
  
    arr
  end
  
end