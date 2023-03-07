module Promotion
  attr_accessor :input 
  def pawn_promotion?(start,target,test_move=false)
    return false unless target[0]==0 || target[0]==7
    puts "checking pawn promotion"

    promotion_input if input == nil
    promote_pawn(self[start],target)
    return true
  end
  def promotion_input(user_input=nil)
    if user_input==nil
      puts "what would you like to promote to?"
      puts " 'Q' 'R' 'B' 'N' "
      user_input ||= gets.chomp
    end
    @input = user_input
  end

  def promote_pawn(pawn,target)
    case input
    when "Q"
      puts "promote to queen"
      self[target]=Queen.new([target],pawn.colour,self)
      self[pawn.position]=nil
      pawn=nil
    end
    input=nil
  end

end