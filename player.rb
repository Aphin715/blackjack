class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def status(score)
    if score > 21
      puts "BUST, LOSER! GIVE ME YOUR MONEY!"
      exit
    else
      true
    end
  end
end