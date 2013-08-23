class Dealer
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def status (score)
    if score < 17
      true
    elsif score > 21
      puts "Dealer busts, you win!"
      exit
    else
      puts "Dealer stands."
      false
    end
  end
end
