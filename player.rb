class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end
  def status(score)
    if score > 21
      puts "You suck at BJs"
      exit
    else
      true
    end
  end
end